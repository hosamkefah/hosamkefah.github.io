  void servo_0(){
unsigned int i =0;
 do
{
    portb.f0=1;
    delay_us(750);
    portb.f0=0;
    delay_us(19250);
    i++;
}
while(i<50);
}


void servo_90(){
unsigned int i =0;
 do
{
    portb.f0=1;
    delay_us(1500);
    portb.f0=0;
    delay_us(18500);
    i++;
}
while(i<50);
}


void servo_180(){
unsigned int i =0;
 do
{
    portb.f0=1;
    delay_us(2250);
    portb.f0=0;
    delay_us(17750);
    i++;
}
while(i<50);
}

unsigned int fff=0;
void main() {
unsigned int temp;
trisa=0xff;
trisb=0x00;
trisc=0x00;
ADC_Init();
PWM1_Init(500);
PWM1_Start();

while(1)
{
unsigned int i;
PWM1_Set_Duty(i%2001);
Delay_ms(500) ;
temp = ADC_Read(0);
temp = (temp * 500) / 1023;


if (fff==0){
   i+=25;
   if(i==200)fff=1;
}
else {
  i-=25;
  if (i==0)fff=0;
}

if (temp<=25)
    servo_0();
else if (25 <temp < 30)
     servo_90();
else if (temp>=30)
    servo_180();

}
}
