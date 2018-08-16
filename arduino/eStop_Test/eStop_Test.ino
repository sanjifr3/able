int LED = 2;
int eStop = 7;
int reset = 4;

void setup ()
{
  pinMode(LED,OUTPUT);
  pinMode(eStop,INPUT);
  pinMode(reset,INPUT);
}

void loop()
{
  while (digitalRead(eStop) == LOW)
  {
    digitalWrite(LED,HIGH);
    delay(1);
  }
  myDelay(1);
}

void myDelay (long pause)
{
  for (int i = 0; i < pause; i++)
  {
    digitalWrite(LED,LOW);
    delay(1);
    while(digitalRead(reset)== LOW)
    {}
  }
}

