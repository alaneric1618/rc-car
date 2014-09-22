//////////////////////////////////////////////////////////////////////////////////  
//////////////////////////////////////////////////////////////////////////////////  
//
//      RC Car Circuit
//
// Copyright Notice                                                                 
//                                                                                  
//     by Eric Bischoff (alaneric1618@gmail.com)                                    
//     Copyright 2014 Eric Bischoff (GNU GPLv3)                                     
//                                                                                  
//     This program is free software: you can redistribute it and/or modify         
//     it under the terms of the GNU General Public License as published by         
//     the Free Software Foundation, either version 3 of the License, or            
//     (at your option) any later version.                                          
//                                                                                  
//     This program is distributed in the hope that it will be useful,              
//     but WITHOUT ANY WARRANTY; without even the implied warranty of               
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                
//     GNU General Public License for more details.                                 
//                                                                                  
//     You should have received a copy of the GNU General Public License            
//     along with this program.  If not, see <http://www.gnu.org/licenses/>.        
//                                                                                  
//////////////////////////////////////////////////////////////////////////////////  

#include <RFduinoBLE.h>
#include <Servo.h>
#define pi 3.141592

double tick = 0;
int ledPin = 2;
int servoPin = 3;
int motorPin = 4;
int motorSpeed = 0;
bool isConnected = false;
Servo* servo = new Servo();

void setup() {
  pinMode(ledPin, OUTPUT);
  pinMode(motorPin, OUTPUT);
  servo->attach(servoPin);
  RFduinoBLE.advertisementData = "rccar";
  RFduinoBLE.begin();
}


void loop() {
  if (isConnected) {
    analogWrite(ledPin, 127*sin(tick/10)+127);
    analogWrite(motorPin, motorSpeed);
    tick++;
  } else {
    analogWrite(ledPin, 0); 
    analogWrite(motorPin, 0);
  }
  delay(33);
}

void RFduinoBLE_onConnect() {
  isConnected = true;
}

void RFduinoBLE_onDisconnect() {
  isConnected = false;
}

void RFduinoBLE_onReceive(char *data, int len) {
  if (len == 2) {
    switch (data[0]) {
      case 0xff:
        servo->write((int)data[1]);
        break;
      case 0xbb:
        motorSpeed = (int)data[1];
        break;
    }
  }
}
