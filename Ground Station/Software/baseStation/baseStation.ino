
#include <OcsStorage.h>
#include <RFM69.h>
#include <Ucglib.h>
#include "Adafruit_BME280.h"
#include <SD.h>
#include <SPI.h>

#ifndef UCG_INTERRUPT_SAFE
#define UCG_INTERRUPT_SAFE
#endif

uint8_t screenNum = 1;

#define Serial SerialUSB

// LOCAL
#define PC_BAUDRATE 57600

// BUTTONS
#define BUTTON_1 5
#define BUTTON_2 4
#define BUTTON_3 3

// RFM69
#define NETWORKID 0   // Must be the same for all nodes (0 to 255)
#define MYNODEID 2   // My node ID (0 to 255)
#define FREQUENCY RF69_433MHZ
#define FREQUENCYSPECIFIC 433800000  // Should be value in Hz, now 433 Mhz will be set
#define chip_select_pin 43
#define interupt_pin 9
#define ENCRYPTKEY    "sampleEncryptKey"

// BME280
#define BME280_ADDRESS_OPEN_CANSAT 0x76   // Set BME's address (according to the circuit)
#define SEALEVELPRESSURE_HPA (1013.25)  // Set sea level pressure value(see: https://en.wikipedia.org/wiki/Atmospheric_pressure)

int ms_delay = 0;

#define calibPress 0 //Pressure difference between reality and BME280 sensor value on probe
#define calibTempA (1) //1 is default, A value for y = a*x+b where x is the initial temperature value
#define calibTempB (0) //0 is default, B value for y = a*x+b where x is the initial temperature value
#define calibHumA (1) //1 is default, A value for y = a*x+b where x is the initial humidity value
#define calibHumB (0) //0 is default, B value for y = a*x+b where x is the initial humidity value

//GPS time adjustment
#define summerTime 1
#define timeZone 1

#define sd_cs_pin 35

bool isRadioOk = true;

// create object 'rf69' from the library, which will
RFM69 radio(chip_select_pin, interupt_pin, true);

//Display
Ucglib_ST7735_18x128x160_HWSPI ucg(6, 7, -1);
OcsGraphics ocsDesign(ucg);
OcsStorage ocsData(ocsDesign);

OcsStorage::message income;

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
} message;

message data;

// Create object 'bme' from the library, which will
Adafruit_BME280 bme;

//SD
File file;

// Empty variables for measured values for BME280
float temperature_bme280 = 0;
float pressure_bme280 = 0;
float altitude_bme280 = 0;
float humidity_bme280 = 0;

void setup() 
{
  Serial.begin(PC_BAUDRATE);
  
  // Space behind font is transparent
  ucg.begin(UCG_FONT_MODE_TRANSPARENT);

  // Clear the screen and reset the clip range to maximum
  ucg.clearScreen();

  ocsDesign.drawBackground();
  ocsDesign.drawHomescreen();

  // Buttons
  pinMode(BUTTON_1, INPUT);
  pinMode(BUTTON_2, INPUT);
  pinMode(BUTTON_3, INPUT);

  // RFM69
  Serial.print(";baseStation ");
  Serial.print(MYNODEID,DEC);
  Serial.println(" is ready");

  if(!radio.initialize(FREQUENCY, MYNODEID, NETWORKID))
  {
	  isRadioOk = false;
	  Serial.println(";RFM69HW initialization failed!");
  }
  else {
    radio.setFrequency(FREQUENCYSPECIFIC);
	  radio.setHighPower(true); // Always use this for RFM69HW
    //radio.encrypt(ENCRYPTKEY);
  }

  // BME280
  if (!bme.begin(BME280_ADDRESS_OPEN_CANSAT))
  {
     Serial.println(";Could not find a valid BME280 sensor");
     return;
  }

  // SD
  if (!SD.begin(sd_cs_pin))
  {
    Serial.println(";SD initialisation failed");
    return;
  }

  Serial.println(";PKII;MessageID;Teplota;Tlak;Vlhkost;Výška(BME280);U-Shunt;U-Bus;Proud;U-Load;RSSI;Zem. šířka(Lat.);Zem.délka(Lon.);Rok;Měsíc;Den;Čas;Hodiny;Minuty;Sekundy;SIV;Výška(GPS);TeplotaW;TlakW;VlhkostW;VýškaW(BME280);Teplota Stanice;Tlak Stanice;Vlhkost Stanice;Výška Stanice(BME280)");
  
}

void loop()
{
  int button1 = digitalRead(BUTTON_1);
  int button2 = digitalRead(BUTTON_2);
  int button3 = digitalRead(BUTTON_3);

  if(button1 == LOW)
  {
	if(screenNum == 1)
	{
	 	screenNum = 0;
	 	ocsDesign.drawLeftScreen();
	 	delay(300);
	 	Serial.println(";Button 1 ");
	}
	else if(screenNum == 2)
	{
		screenNum = 1;
	 	ocsDesign.drawHomescreen();
	 	delay(300);
	 	Serial.println(";Button 1 ");
	}
  }
  else if(button2 == LOW)
  {
	if(screenNum != 1)
	{
	 	screenNum = 1;
	 	ocsDesign.drawHomescreen();
	 	delay(300);
	 	Serial.println(";Button 2 ");
	}
  }
  else if(button3 == LOW)
  {
	if(screenNum == 1)
	{
		screenNum = 2;
  	 	ocsDesign.drawRightScreen();
	 	delay(300);
  	 	Serial.println(";Button 3 ");
	}
	else if(screenNum == 0)
	{
		screenNum = 1;
	 	ocsDesign.drawHomescreen();
	 	delay(300);
	 	Serial.println(";Button 3 ");
	}
  }  

  // Read values from BME280 into the variables
  temperature_bme280 = bme.readTemperature();
  pressure_bme280 = bme.readPressure() / 100.0F;
  altitude_bme280 = bme.readAltitude(SEALEVELPRESSURE_HPA);
  humidity_bme280 = bme.readHumidity();

  if (radio.receiveDone())
  {
    data = *(message*)radio.DATA;

    Serial.print(";PKII_OCS;" + String(data.messageId));
    Serial.print(";" + String(calibTempA * data.temperature + calibTempB));
    Serial.print(";" + String(data.pressure + calibPress));
    Serial.print(";" + String(calibHumA * data.humidity + calibHumB));
    Serial.print(";" + String(data.altitude));
    Serial.print(";" + String(data.voltage_shunt));
    Serial.print(";" + String(data.voltage_bus));
    Serial.print(";" + String(data.current_mA));
    Serial.print(";" + String(data.voltage_load));
    Serial.print(";" + String(data.rssi));
    Serial.print(";" + String(data.latitude));
    Serial.print(";" + String(data.longitude));
    Serial.print(";" + String(data.latitude) + " N");
    Serial.print(" " + String(data.longitude) + " E");
    Serial.print(";" + String(data.year));
    Serial.print(";" + String(data.month));
    Serial.print(";" + String(data.day));
    Serial.print(";" + String(data.hour + summerTime + timeZone) + ":" + String(data.minute) + ":" + String(data.sec));
    Serial.print(";" + String(data.hour + summerTime + timeZone));
    Serial.print(";" + String(data.minute));
    Serial.print(";" + String(data.sec));
    Serial.print(";" + String(data.SIV));
    Serial.print(";" + String(data.altitudeGPS));
    Serial.print(";" + String(data.temperature_wrong));
    Serial.print(";" + String(data.pressure_wrong));
    Serial.print(";" + String(data.humidity_wrong));
    Serial.print(";" + String(data.altitude_wrong));
     
    // BaseStation data
    Serial.print(";" + (String) temperature_bme280);  
    Serial.print(";" + (String) pressure_bme280);
    Serial.print(";" + (String) humidity_bme280);
    Serial.print(";" + (String) altitude_bme280);
    
    Serial.println();

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
     
     // BaseStation data
    file.print(";" + (String) temperature_bme280);  
    file.print(";" + (String) pressure_bme280);
    file.print(";" + (String) humidity_bme280);
    file.print(";" + (String) altitude_bme280);
    
    file.println();

    file.close();
    } else {
      Serial.println(";SD error");
    }
	  income = *(OcsStorage::message*)radio.DATA;
	  ocsData.Update(income, screenNum);
  }
  
  delay(ms_delay);
}
