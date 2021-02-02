void senddata(int,int,int,int,int,int,int,int,int,int,int,int);
void setpath(int);
Ulong setval(Ulong,int,int,int);

void GATE_ON()
{
	gpio_set( GATE, 1 );
	puts("GATE ON.");
}
void GATE_OFF()
{
	gpio_set( GATE, 0 );
	puts("GATE OFF.");
}

void fpga_ctrl( int path, Ulong val)
{
	char BUSYflag;

	if(val < 108 && (
				path == 2 ||
				path == 10 ||
				path == 18 ||
				path == 26 ||
				path == 34 ||
				path == 50 ||
				path == 66 ||
				path == 82 ||

				path == 97 ||
				path == 113 ||

				path == 136 ||
				path == 152 ||
				path == 168
			)
		)
		val = freq[val];

	printf("%lu\n",val);

	do{
		BUSYflag = gpio_read(BUSY);
	}while(BUSYflag==1);
	gpio_set(BUSY,1);
	setpath(path);
	val = setval(val,0,0,0);
	val = setval(val,1,0,0);
	val = setval(val,0,1,0);
	val = setval(val,1,1,1);
	gpio_set(BUSY,0);
}

void senddata(int val0,int val1,int val2,int val3,int val4,int val5,int val6,int val7,int valSEG0,int valSEG1,int valADDR_DATA,int valSENT)
{
	int i = FPGA_CLOCK_WAIT;
	gpio_set(BIT0,val0);
	gpio_set(BIT1,val1);
	gpio_set(BIT2,val2);
	gpio_set(BIT3,val3);
	gpio_set(BIT4,val4);
	gpio_set(BIT5,val5);
	gpio_set(BIT6,val6);
	gpio_set(BIT7,val7);
	gpio_set(SEG0,valSEG0);
	gpio_set(SEG1,valSEG1);
	gpio_set(ADDR_DATA,valADDR_DATA);
	gpio_set(SENT,valSENT);

	gpio_set(ENABLE,1);
	while(i-- > 0);
	gpio_set(ENABLE,0);
}

void setpath(int path)
{
	int path0,path1,path2,path3,path4,path5,path6,path7;
	path0 = path%2;
	path1 = (path = (path/2))%2;
	path2 = (path = (path/2))%2;
	path3 = (path = (path/2))%2;
	path4 = (path = (path/2))%2;
	path5 = (path = (path/2))%2;
	path6 = (path = (path/2))%2;
	path7 = (path/2)%2;

	printf("%d%d%d%d%d%d%d%d0010\n",path0,path1,path2,path3,path4,path5,path6,path7);
	senddata(
		path0,
		path1,
		path2,
		path3,
		path4,
		path5,
		path6,
		path7,
		0,
		0,
		1,
		0);
}

Ulong setval(Ulong val,int valSEG0, int valSEG1, int valSENT)
{
	int val0,val1,val2,val3,val4,val5,val6,val7;

	val0 = (int)(val%(Ulong)2);
	val /= (Ulong)2;
	val1 = (int)(val%(Ulong)2);
	val /= (Ulong)2;
	val2 = (int)(val%(Ulong)2);
	val /= (Ulong)2;
	val3 = (int)(val%(Ulong)2);
	val /= (Ulong)2;
	val4 = (int)(val%(Ulong)2);
	val /= (Ulong)2;
	val5 = (int)(val%(Ulong)2);
	val /= (Ulong)2;
	val6 = (int)(val%(Ulong)2);
	val /= (Ulong)2;
	val7 = (int)(val%(Ulong)2);
	val /= (Ulong)2;

	printf("%d%d%d%d%d%d%d%d%d%d0%d\n",val0,val1,val2,val3,val4,val5,val6,val7,valSEG0,valSEG1,valSENT);

	senddata(
		val0,
		val1,
		val2,
		val3,
		val4,
		val5,
		val6,
		val7,
		valSEG0,
		valSEG1,
		0,
		valSENT);

	return val;
}
