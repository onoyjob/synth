void voicing(int,int,int,int,int,int,int);
void note4(int);
void note8(int);
void note16(int);
void note32(int);
void note64(int);
void note8_3(int);
void note16_3(int);
void note32_3(int);
void note64_3(int);
int bar;
int demo(int bpm)
{
	int val,i;
	gpio_set(DEMO,1);
	bar = (60 * 1000 * 1000 * 4) / bpm;

	while(1){

		voicing(C0  ,C0  ,C0  ,C0  ,C0  ,C0  ,C0  );
		voicing(MUTE,E5-1,G5  ,A5-1,C6  ,E6-1,G6  );
		note8(4);

		voicing(MUTE,MUTE,MUTE,G4  ,B5-1,D5  ,F5  );
		note16(1);
		GATE_OFF();
		note16(1);

		voicing(MUTE,E4-1,G4  ,A4-1,C5  ,E5-1,G5  );
		note8(3);

		voicing(MUTE,C4  ,E4-1,G4  ,B5-1,D5  ,F5  );
		note16(1);
		GATE_OFF();
		note16(1);

		voicing(MUTE,A3-1,D4  ,G4  ,A4-1,B4  ,G5  );
		note8(2);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,F4  );
		note8(1);

		voicing(E1-1,E2-1,F4  ,G4  ,B4-1,D5  ,G5  );
		note8(2);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,B5-1);
		note8(1);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,C6  );
		note8(1);

		voicing(D1  ,D2  ,C3  ,F3  ,G4  ,D5  ,G5  );
		note32(1);
		fpga_ctrl( 10, (Ulong)(D5+1));
		note32(1);
		fpga_ctrl( 10, (Ulong)E5 );
		note32(2);
		note8(1);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,C5  ,MUTE);
		note8(1);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,A4  ,MUTE);
		note8(1);

		voicing(MUTE,MUTE,MUTE,B3  ,MUTE,G4  ,D5  );
		note8(1);
		voicing(MUTE,MUTE,MUTE,C4  ,F4  ,A4  ,E5  );
		note8(3);

		voicing(E1  ,E2  ,D3  ,G3+1,B3  ,D4  ,F4  );
		note8(1);
		voicing(A1  ,A2  ,C3+1,G3  ,B3-1,D4-1,G4  );
		note8(1);
		voicing(D1  ,D2  ,C3  ,F4  ,C4  ,E4  ,A4  );
		note8(1);
		voicing(G1  ,G2  ,F3  ,B3  ,E4  ,G4+3,B4  );
		note8(1);
		fpga_ctrl( 2, (Ulong)D5 );
		note8(1);
		voicing(C1  ,C2  ,G2  ,E3  ,D4  ,G4  ,A4  );
		note32(1);
		fpga_ctrl( 2, (Ulong)B4 );
		note32(3);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,G4  );
		note8(1);
		voicing(C2  ,C3  ,B3-1,MUTE,E4-1,G4  ,C5  );
		note8(1);
		voicing(F1  ,F2  ,E3-1,A3  ,D4  ,G4-1,D5  );
		note8(1);
		voicing(B1-1,B2-1,A3-1,E4-1,G4  ,C5  ,E5-1);
		note8(4);

		note32(3);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,E3-1,G3  );
		note32(1);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,A3-1);
		note32(1);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,C4  );
		note32(1);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,E4-1);
		note32(1);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,G4  );
		note32(1);

		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,B4-1);
		note16_3(2);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,C5  );
		note16_3(1);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,E5-1);
		note16_3(2);
		voicing(MUTE,MUTE,A3-1,C4  ,E4-1,G4  ,G5  );
		note16_3(1);


		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,B5-1);
		note8(1);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,C6  );
		note8(1);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,E6-1);
		note8(1);
		voicing(MUTE,A3-1,D4  ,F4  ,A5-1,B5  ,F6  );
		note8(1);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,E6-1);
		note8(1);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,D6  );
		note8(1);

		voicing(E1-1,E2-1,C4  ,F4  ,G4  ,MUTE,MUTE);
		note32(2);
		voicing(MUTE,MUTE,MUTE,C5  ,D5  ,F5  ,B5-1);
		note32(1);
		fpga_ctrl( 10, (Ulong)(F5+1) );
		note32(1);
		fpga_ctrl( 10, (Ulong)G5 );
		note8(1);

		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,F5+1);
		note16_3(2);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,F5  );
		note16_3(1);
		voicing(MUTE,MUTE,MUTE,MUTE,MUTE,MUTE,E5-1);
		note16_3(2);

		voicing(G1  ,G2  ,F3  ,A3  ,C5  ,D5  ,G5  );
		note32(1);
		fpga_ctrl( 10, (Ulong)(D5+1) );
		note32(1);
		fpga_ctrl( 10, (Ulong)E5 );
		note8(9);

	}
	return 0;
}
void voicing(int s1, int v6, int v5, int v4, int v3, int v2, int v1)
{
	if(gpio_read(DEMO) == 0)
		exit(EXIT_SUCCESS);

	GATE_OFF();

	if(v1){
		fpga_ctrl( 0, (Ulong)1 );
		fpga_ctrl( 2, (Ulong)v1 );
	} else {
		fpga_ctrl( 0, (Ulong)0 );
	}
	if(v2){
		fpga_ctrl( 8, (Ulong)1 );
		fpga_ctrl( 10, (Ulong)v2 );
	} else {
		fpga_ctrl( 8, (Ulong)0 );
	}
	if(v3){
		fpga_ctrl( 16, (Ulong)1 );
		fpga_ctrl( 18, (Ulong)v3 );
	} else {
		fpga_ctrl( 16, (Ulong)0 );
	}
	if(v4){
		fpga_ctrl( 24, (Ulong)1 );
		fpga_ctrl( 26, (Ulong)v4 );
	} else {
		fpga_ctrl( 24, (Ulong)0 );
	}
	if(v5){
		fpga_ctrl( 32, (Ulong)1 );
		fpga_ctrl( 34, (Ulong)v5 );
	} else {
		fpga_ctrl( 32, (Ulong)0 );
	}
	if(v6){
		fpga_ctrl( 40, (Ulong)1 );
		fpga_ctrl( 42, (Ulong)v6 );
	} else {
		fpga_ctrl( 40, (Ulong)0 );
	}
	if(s1){
		fpga_ctrl( 95, (Ulong)1 );
		fpga_ctrl( 97, (Ulong)s1 );
	} else {
		fpga_ctrl( 95, (Ulong)0 );
	}

	GATE_ON();
}
void note4(int n)
{
  note8(n*2);
}
void note8(int n)
{
  note16(n*2);
}
void note16(int n)
{
  note32(n*2);
}
void note32(int n)
{
  note64(n*2);
}
void note64(int n)
{
	while(n--){
		if(gpio_read(DEMO) == 0)
			exit(EXIT_SUCCESS);
		usleep((bar)/64);
	}
}
void note8_3(int n)
{
  note16_3(n*2);
}
void note16_3(int n)
{
  note32_3(n*2);
}
void note32_3(int n)
{
  note64_3(n*2);
}
void note64_3(int n)
{
	while(n--){
		if(gpio_read(DEMO) == 0)
			exit(EXIT_SUCCESS);
		usleep((bar)/96);
	}
}
