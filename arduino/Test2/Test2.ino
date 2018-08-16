int GreenPin = 10; // Define digital interface #10
int YellowPin = 11;
int RedPin = 12;
int PotPin = 0;
int ButPin = 7;
int SwitchPin = 2;
int RelayPin = 3;
int val = 0;
int val2 = 0;
int val3 = 0;
int Pin0 = 4;
int Pin1 = 5;
int Pin2 = 6;
int Pin3 = 9;
int _step = 0;
boolean dir = true;

void setup() 
{
  // put your setup code here, to run once:
  pinMode(GreenPin,OUTPUT); // Define led interface as output
  pinMode(YellowPin,OUTPUT);
  pinMode(RedPin,OUTPUT);
  pinMode(ButPin,INPUT);
  pinMode(SwitchPin,INPUT);
  Serial.begin(9600);
  pinMode(RelayPin,OUTPUT);
  pinMode(Pin0,OUTPUT);
  pinMode(Pin1,OUTPUT);
  pinMode(Pin2,OUTPUT);
  pinMode(Pin3,OUTPUT);
}

void loop() 
{
  // put your main code here, to run repeatedly:
  val = analogRead(PotPin);
  Serial.println(val);
  analogWrite(GreenPin,val/4);
  
  val2 = digitalRead(ButPin);
  if (val2 == LOW)
  {
    digitalWrite(RedPin,LOW);
    digitalWrite(RelayPin,LOW);
  }
  else
  {
    digitalWrite(RedPin,HIGH);
    digitalWrite(RelayPin,HIGH);
  }
  
  val3 = digitalRead(SwitchPin);
  if (val3 == LOW)
  {
    digitalWrite(YellowPin,LOW);
  }
  else
  {
    digitalWrite(YellowPin,HIGH);
  }
  
  switch(_step)
  {
    case 0:
    digitalWrite(Pin0,LOW);
    digitalWrite(Pin1,LOW);
    digitalWrite(Pin2,LOW);
    digitalWrite(Pin3,HIGH);
    break;
    
    case 1:
    digitalWrite(Pin0,LOW);
    digitalWrite(Pin1,LOW);
    digitalWrite(Pin2,HIGH);
    digitalWrite(Pin3,HIGH);
    break;
 
    case 2:
    digitalWrite(Pin0,LOW);
    digitalWrite(Pin1,LOW);
    digitalWrite(Pin2,HIGH);
    digitalWrite(Pin3,LOW);
    break;

    case 3:
    digitalWrite(Pin0,LOW);
    digitalWrite(Pin1,HIGH);
    digitalWrite(Pin2,HIGH);
    digitalWrite(Pin3,LOW);
    break;

    case 4:
    digitalWrite(Pin0,LOW);
    digitalWrite(Pin1,HIGH);
    digitalWrite(Pin2,LOW);
    digitalWrite(Pin3,LOW);
    break;

    case 5:
    digitalWrite(Pin0,HIGH);
    digitalWrite(Pin1,HIGH);
    digitalWrite(Pin2,LOW);
    digitalWrite(Pin3,LOW);
    break;

    case 6:
    digitalWrite(Pin0,HIGH);
    digitalWrite(Pin1,LOW);
    digitalWrite(Pin2,LOW);
    digitalWrite(Pin3,LOW);
    break;

    case 7:
    digitalWrite(Pin0,HIGH);
    digitalWrite(Pin1,LOW);
    digitalWrite(Pin2,LOW);
    digitalWrite(Pin3,HIGH);
    break;
    
    default:
    digitalWrite(Pin0,LOW);
    digitalWrite(Pin1,LOW);
    digitalWrite(Pin2,LOW);
    digitalWrite(Pin3,LOW);
    break;
  }
  
  if(dir)
  {
    _step++;
  }
  
  else
  {
    _step--;
  }
  
  if(_step>7)
  {
    _step=0;
  }
  
  if(_step<0)
  {
    _step=7;
  }
  delay(1);
}  
