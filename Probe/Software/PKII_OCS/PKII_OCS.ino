
#include "Arduino.h"

#include <Adafruit_BME280.h>  // include Adafruit BME280 library
#include <Adafruit_INA219.h>  // include INA219
#include <SD.h> 				 // include Arduino SD library
#include "SparkFun_Ublox_Arduino_Library.h" //include SparkFun Ublox Arduino Library
#include <RFM69.h>			 // include RFM69 library
#include <SPI.h>
#include <Wire.h>

// Local
#define PC_BAUDRATE 57600
#define MS_DELAY 250  // Number of milliseconds between data sending and LED signalization
#define LED_DELAY 0
#define Serial SerialUSB

// RFM69
#define NETWORKID 0  		   // Must be the same for all nodes (0 to 255)
#define MYNODEID 1   		   // My node ID (0 to 255)
#define TONODEID 2   		   // Destination node ID (0 to 254, 255 = broadcast)
#define FREQUENCY RF69_433MHZ   // Frequency set up
#define FREQUENCYSPECIFIC 433800000  // Should be value in Hz, now 433 Mhz will be set
#define CHIP_SELECT_PIN 43 //radio chip select
#define INTERUP_PIN 9 //radio interrupt
#define ENCRYPTKEY    "sampleEncryptKey"

// BME280 SETTING
#define BME280_ADDRESS_OPEN_CANSAT1 0x77
#define BME280_ADDRESS_OPEN_CANSAT2 0x76
#define SEALEVELPRESSURE_HPA 1013.25

//calibrate BME280
#define calibPress 0 //Pressure difference between reality and BME280 sensor value
#define calibTempA 1 //1 is default, A value for y = a*x+b where x is the initial temperature value
#define calibTempB 0 //0 is default, B value for y = a*x+b where x is the initial temperature value
#define calibHumA 1 //1 is default, A value for y = a*x+b where x is the initial humidity value
#define calibHumB 0 //0 is default, B value for y = a*x+b where x is the initial humidity value

//GPS time adjustment
#define summerTime 1
#define timeZone 1

// SD card
#define sd_cs_pin 35 // set SD's chip select pin (according to the circuit)

//create GPS object
SFE_UBLOX_GPS myGPS;

// create object 'rf69' from the library, which will
RFM69 radio(CHIP_SELECT_PIN, INTERUP_PIN, true);

// define our own struct data type with variables; used to send data
typedef struct
{
  int16_t messageId;
  uint16_t year;
  uint8_t month;
  uint8_t day;
  uint8_t hour;
  uint8_t minute;
  uint8_t sec;
  long latitude;
  long longitude;
  long altitudeGPS;
  byte SIV;
  float temperature;
  float pressure;
  float altitude;
  float humidity;
  float voltage_shunt;
  float voltage_bus;
  float current_mA;
  float voltage_load;
  int16_t rssi;
  float temperature_wrong;
  float pressure_wrong;
  float altitude_wrong;
  float humidity_wrong;
} messageOut;

messageOut data; //create the struct variable

// create object 'bme' from the library, which will
Adafruit_BME280 bme1;
Adafruit_BME280 bme2;

// create object 'ina219' from the library with address 0x40
Adafruit_INA219 ina219(0x40);

// SD card file
File file;

// LEDS
#define D13_led_pin 42 	// D13 LED
#define M_led_pin 36 	// MLED

// Local variables
int idCounter = 1;
bool isBmeOk = true;
bool isSdOk = true;
bool isRadioOk = true;
long lastTime = 0; //Simple local timer. Limits amount if I2C traffic to Ublox module.

void setup()
{ 
  Serial.begin(PC_BAUDRATE);

  //uncomment for use with computer
  // while(!Serial);

  Serial.println("PKII OCS");

  Serial.print("Node ");
  Serial.print(MYNODEID,DEC);
  Serial.println(" ready");
  
  // begin communication with the BME280 on the previously specified address
  if (!bme1.begin(BME280_ADDRESS_OPEN_CANSAT1))
  {
	  isBmeOk = false;
	  Serial.println("Could not find a valid first BME280 sensor");
	  return;
  }

  if (!bme2.begin(BME280_ADDRESS_OPEN_CANSAT2))
  {
    isBmeOk = false;
    Serial.println("Could not find a valid second BME280 sensor");
    return;
  }

  // begin communication with the INA219
  ina219.begin();

  if (!SD.begin(sd_cs_pin))
  {
    Serial.println("SD card initialization failed");
    return;
   }

  if(!radio.initialize(FREQUENCY, MYNODEID, NETWORKID))
  {
	  isRadioOk = false;
	  Serial.println("RFM69HW initialization failed");
  }
  else {
    radio.setFrequency(FREQUENCYSPECIFIC);
	  radio.setHighPower(true); // Always use this for RFM69HW
    //radio.encrypt(ENCRYPTKEY);
  }

  //LEDs
  pinMode(D13_led_pin, OUTPUT);
  pinMode(M_led_pin, OUTPUT);

  Wire.begin();

  if (myGPS.begin() == false) //Connect to the Ublox module using Wire port
  {
    Serial.println(F("Ublox GPS not detected at default I2C address"));
    while (1);
  }

  myGPS.setI2COutput(COM_TYPE_UBX); //Set the I2C port to output UBX only (turn off NMEA noise)
  myGPS.saveConfiguration();        //Save the current settings to flash and BBR

}

void loop()
{
  //LED
  digitalWrite(D13_led_pin, HIGH);
  digitalWrite(M_led_pin, HIGH);
  
  data.messageId = idCounter;

  Serial.println("MessageId = " + static_cast<String>(data.messageId));

  //BME280
  data.temperature = 0;
  data.pressure = 0;
  data.altitude = 0;
  data.humidity = 0;

  data.temperature_wrong = 0;
  data.pressure_wrong = 0;
  data.altitude_wrong = 0;
  data.humidity_wrong = 0;

  if(isBmeOk)
  {
	  data.temperature += bme2.readTemperature();
	  data.pressure += bme2.readPressure() / 100.0F;
	  data.altitude += bme2.readAltitude(SEALEVELPRESSURE_HPA);
	  data.humidity = bme2.readHumidity();
    
    data.temperature_wrong = bme1.readTemperature();
    data.pressure_wrong = bme1.readPressure() / 100.0F;
    data.altitude_wrong = bme1.readAltitude(SEALEVELPRESSURE_HPA);
    data.humidity_wrong = bme1.readHumidity();
  }

  Serial.println("Temperature2 = " + static_cast<String>(data.temperature) + " *C");
  Serial.println("Temperature1 = " + static_cast<String>(data.temperature_wrong) + " *C");
  Serial.println("Pressure2 = " + static_cast<String>(data.pressure) + " Pa");
  Serial.println("Pressure1 = " + static_cast<String>(data.pressure_wrong) + " Pa");
  Serial.println("Approx altitude2 = " + static_cast<String>(data.altitude) + " m");
  Serial.println("Approx altitude1 = " + static_cast<String>(data.altitude_wrong) + " m");
  Serial.println("Humidity2 = " + static_cast<String>(data.humidity) + " %");
  Serial.println("Humidity1 = " + static_cast<String>(data.humidity_wrong) + " %");

  //INA219
  data.voltage_shunt = ina219.getShuntVoltage_mV();
  data.voltage_bus = ina219.getBusVoltage_V();
  data.current_mA = ina219.getCurrent_mA();
  data.voltage_load = data.voltage_bus + (data.voltage_shunt / 1000);

  Serial.println("Shunt Voltage: " + static_cast<String>(data.voltage_shunt) + " mV");
  Serial.println("Bus Voltage: " + static_cast<String>(data.voltage_bus) + " V");
  Serial.println("Current: " + static_cast<String>(data.current_mA) + " mA");
  Serial.println("Load Voltage: " + static_cast<String>(data.voltage_load) + " V");

  //GPS
  data.year = 0;
  data.month = 0;
  data.day = 0;
  data.hour = 0;
  data.minute = 0;
  data.sec = 0;
  data.latitude = 0;
  data.longitude = 0;
  data.altitudeGPS = 0;
  data.SIV = 0;

  if (millis() - lastTime > 1000)
  {
    lastTime = millis(); //Update the timer

    data.latitude = myGPS.getLatitude();
    data.longitude = myGPS.getLongitude();
    data.altitudeGPS = myGPS.getAltitude();
    data.year = myGPS.getYear();
    data.month = myGPS.getMonth();
    data.day = myGPS.getDay();
    data.hour = myGPS.getHour();
    data.minute = myGPS.getMinute();
    data.sec = myGPS.getSecond();
    data.SIV = myGPS.getSIV();   

    Serial.print("Lat: " + static_cast<String>(data.latitude));
    Serial.print(" Long: " + static_cast<String>(data.longitude));
    Serial.print(" (degrees * 10^-7)");
    Serial.print(" Alt: " + static_cast<String>(data.altitudeGPS));
    Serial.print(" (mm)");
    Serial.print(" SIV: " + static_cast<String>(data.SIV));

    Serial.println();
    Serial.print(data.year);
    Serial.print("-");
    Serial.print(data.month);
    Serial.print("-");
    Serial.print(data.day);
    Serial.print(" ");
    Serial.print(data.hour + summerTime + timeZone);
    Serial.print(":");
    Serial.print(data.minute);
    Serial.print(":");
    Serial.print(data.sec);

    Serial.println();
  }
  
  //RFM69HW
  data.rssi = 0;

  if(isRadioOk)
  {
	  data.rssi = radio.RSSI;
	  Serial.println("Signal = " + static_cast<String>(radio.RSSI));

	  radio.send(TONODEID, (const void*)&data, sizeof(data));
  }

  //SD
  file = SD.open("data.csv", FILE_WRITE);
  
  if(file)
  {
    file.print(";PKII_OCS;" + String(data.messageId));
    file.print(";" + String(calibTempA * data.temperature + calibTempB));
    file.print(";" + String(data.pressure + calibPress));
    file.print(";" + String(calibHumA * data.humidity + calibHumB));
    file.print(";" + String(data.altitude));
    file.print(";" + String(data.voltage_shunt));
    file.print(";" + String(data.voltage_bus));
    file.print(";" + String(data.current_mA));
    file.print(";" + String(data.voltage_load));
    file.print(";" + String(data.rssi));
    file.print(";" + String(data.latitude));
    file.print(";" + String(data.longitude));
    file.print(";" + String(data.latitude) + " N");
    file.print(" " + String(data.longitude) + " E");
    file.print(";" + String(data.year));
    file.print(";" + String(data.month));
    file.print(";" + String(data.day));
    file.print(";" + String(data.hour + summerTime + timeZone) + ":" + String(data.minute) + ":" + String(data.sec));
    file.print(";" + String(data.hour + summerTime + timeZone));
    file.print(";" + String(data.minute));
    file.print(";" + String(data.sec));
    file.print(";" + String(data.SIV));
    file.print(";" + String(data.altitudeGPS));
    file.print(";" + String(data.temperature_wrong));
    file.print(";" + String(data.pressure_wrong));
    file.print(";" + String(data.humidity_wrong));
    file.print(";" + String(data.altitude_wrong));
     
    file.println();
    
    file.close();
  }
  else {
    Serial.println("Error opening data.csv");
  }

  Serial.println();

  idCounter ++;

  //LED
  digitalWrite(D13_led_pin, LOW);
  digitalWrite(M_led_pin, LOW);

  delay(MS_DELAY);
}
