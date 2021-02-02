void chord(char key, char chord) {
	int osc[5]={2,10,18,26,34};
	int chordlist[4][4][5]={
		{
			{ 62,59,55,52,48 },
			{ 59,52,50,43,36 },
			{ 55,52,50,43,36 },
			{ 64,59,55,48,36 }
		},
		{
			{ 58,55,53,51,48 },
			{ 62,58,55,51,48 },
			{ 55,51,50,46,36 },
			{ 58,53,51,43,36 }
		},
		{
			{ 63,58,56,52,48 },
			{ 56,52,49,46,36 },
			{ 72,68,63,52,36 },
			{ 70,66,61,52,36 }
		},
		{
			{ 62,58,57,53,48 },
			{ 65,62,58,55,48 },
			{ 53,50,48,46,32 },
			{ 58,53,50,46,32}
		}};
	int voicing,trans,i,tone;
	srand(rand_seed++);
	voicing = rand() % 4;

	fpga_ctrl(0,1);
	fpga_ctrl(8,1);
	fpga_ctrl(16,1);
	fpga_ctrl(24,1);
	fpga_ctrl(32,1);
	fpga_ctrl(48,0);
	fpga_ctrl(64,0);
	fpga_ctrl(80,0);

	trans = (int)((int)key - (int)'D');
	printf("trans %d\n",trans);
	for(i=0;i<5;i++){
		tone = (osc[i],(chordlist[chord-'0'][voicing][i] + trans));
		if(tone > 68) tone = tone-12;
		fpga_ctrl(osc[i],tone);
		printf("fpga_ctrl(%d,%d);",osc[i],tone);
	}
}
