
#include <avr/io.h>
#include <util/delay.h>

/*
//Write to register
void DigitalWrite(unsigned int val)
{
	PORTD = 0x00;                          //start writing
	for (unsigned int i = 0; i < 16; i++)
	{
		PORTD = (val>>i)&0x01;
		PORTD = ((val>>i)&0x01)|0x04;
		_delay_us(900);
		PORTD = (val>>i)&0x01;
		_delay_us(900);
	}
	PORTD = 0x02;                          //end writing
}
//*/

// Serial out <numb> bits from datapin using clockpin as /clk in direction (Most Significant Bit First, or, Least Significant Bit First)
void ShiftOutB(int val, int datapin, int clockpin, int direction, int numb)
{
	unsigned char byte = 0;
	if(direction == 1)
	{
		for (int i = 0; i < numb; i++)
		{
			PORTB = PORTB|(((((val >> i)) & 0x01)<< datapin)|(0x01 << clockpin));
			PORTB = 0x00;
		}
	}
	else
	{
		for (int i = numb - 1; i >= 0; i--)
		{
			PORTB = PORTB|(((((val >> i)) & 0x01)<< datapin)|(0x01 << clockpin));
			PORTB = 0x00;
		}
	}
}

//same as ShiftOut with adding PortD or PortB. Each port needs own ShiftOut function. Also added MR pin
void RegWrite(int port, int val, int MR, int CLK, int DS, int direction, int numb)
{
	if (port)
	{
		PORTB = 0x00;
		ShiftOutB(val,DS,CLK,direction, numb);
		PORTB = 0x01<<MR;
	}
	else
	{
		//PORTD = 0x00;
		//ShiftOutD(val,DS,CLK,direction, numb);
		//PORTD = 0x01<<MR;
	}
}

// Switch on one LED in 4*4*4 LED matrix on x,y,z coordinates
void MatWrite(unsigned int x, unsigned int y, unsigned int z)
{
	/*		   0,0,0
	             /-----------------------------------/
	          /                                   /  |
	      Z/                                   /     |
	     /                                   /       |
	  /               X                   /          |
	|-----------------------------------|            |
	|                                   |            |
	|                                   |            |
	|                                   |            |
	|                                   |            |
   Y|                                   |            |
	|                                   |            /
	|                                   |          /
	|                                   |       /
	|                                   |    / 
	|-----------------------------------| / 
	*/

	x = 3 - x;  //change x
	y = 3 - y;  // and y direction

	int xx = x;
	x = y;      //Swap x and y
	y = xx;

	x = 0x01 << x;  // Write 1 in same bit as x value
	y = ((~(0x01 << y)) & 0x0F); //Write 1 in same bit as y value and invert last 4 bits
	unsigned int byte;
	byte = ((x<<4) + y) & 0xFF;  //Write x as High bits and y as Low bits

	//Write to Register
	if (z == 0) {RegWrite(1, byte << 8, 0, 2, 1, 1, 16); RegWrite(1, 0, 3, 5, 4, 1, 16); }
	if (z == 1) {RegWrite(1, byte, 0, 2, 1, 1, 16); RegWrite(1, 0, 3, 5, 4, 1, 16); }
	if (z == 2) {RegWrite(1, byte << 8, 3, 2, 4, 1, 16); RegWrite(1, 0, 0, 2, 1, 1, 16); }
	if (z == 3) {RegWrite(1, byte, 3, 2, 4, 1, 16); RegWrite(1, 0, 0, 2, 1, 1, 16); }

}

int main(void)
{
	DDRB = 0xFF;
	while(1)
	{
		/*														//Uncomment here. Serial change. Correct
		unsigned int x;
		for(int z = 0; z < 2; z++)
		{
			for (unsigned int i = 128; i >= 16; i /= 2)
			{
				for (unsigned int j = 8; j >= 1; j /= 2)
				{	
					x = ((~j)&0x0F) + i;
					x = x<<(z*8);
					RegWrite(1, x, 0, 2, 1, 1, 16);
					_delay_ms(10); 
				}
			}
		}
		for(int z = 0; z < 2; z++)
		{
			for (unsigned int i = 128; i >= 16; i /= 2)
			{
				for (unsigned int j = 8; j >= 1; j /= 2)
				{
					x = ((~j)&0x0F) + i;
					x = x<<(z*8);
					RegWrite(1, x, 3, 5, 4, 1, 16);
					_delay_ms(10);
				}
			}
		}
		//*/
		//*                                                  //Uncomment here. Send xyz. Correct		
		for (int z = 0; z < 4; z++)
		{
			for (int x = 0; x < 4; x++)
			{
				for (int y = 0; y < 4; y++)
				{
					MatWrite(x,y,z);		
					_delay_ms(10);
				}
				_delay_ms(100);
			}
		}
	}
}