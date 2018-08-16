#include<Stepper.h>

// LEDs
int GreenLED = 3; // ON/Ready Light
int YellowLED = 4; // Motor Running Light

// EStop Switch
int EStop = 7; // EStop Switch
volatile int state = LOW;

// Motor Control PWM
// int PWMB = 5; // Forward Motor Control
// int PWMA = 6; // Backwards Motor Control
// int MotEnable = 8;

// Temp Motor Control - Delete
int IN1 = 8;
int IN2 = 9;
int IN3 = 10;
int IN4 = 11; 

// EMG Signals
// int EMG1 = 0; // EMG Signal 1
// int EMG2 = 1; // EMG Signal 2
// int EMG3 = 2; // EMG Signal 3

// Encoder Signals
// int EncA = 3; // Encoder A
// int EncB = 4; // Encoder B

// Motor Current Sense
// int MotI = 5; // Forwards Current Sense


// Variables
// double valEMG1 = 0;
// double valEMG2 = 0;
// double valEMG3 = 0;
// int valEncA = 0;
// int valEncB = 0;

// Temp Motor Control - Delete
int valPot = 0;
int valEStop = 0;
int stepsPerRev = 100;
int _step = 0;
boolean dir = true;

// Initialize Stepper
Stepper myStepper(stepsPerRev, IN1, IN2, IN3, IN4);

void setup()
{
  pinMode(GreenLED,OUTPUT);
  pinMode(YellowLED,OUTPUT);
  
  pinMode(EStop,OUTPUT);
  attachinteer
  
  pinMode(IN1,OUTPUT);
  pinMode(IN2,OUTPUT);
  pinMode(IN3,OUTPUT);
  pinMode(IN4,OUTPUT);
  
  myStepper.setSpeed(100);
  //myStepper.step(100);
  
  Serial.begin(9600);

}

void loop()
{
  while(EStop = LOW);
  Serial.println("clockwise");
  myStepper.step(stepsPerRev);
  delay(500);
  
  Serial.println("counterclockwise");
  myStepper.step(-stepsPerRev);
  delay(500);

}
