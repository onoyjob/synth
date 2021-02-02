#define GPIO_BASE 0x20200000
#define BLOCK_SIZE 4096

#define GPIO_OUTPUT 0x1

#define FPGA_CLOCK_WAIT 100


#define BIT0 26
#define BIT1 19
#define BIT2 13
#define BIT3 6
#define BIT4 5
#define BIT5 0
#define BIT6 11
#define BIT7 9
#define SEG0 10
#define SEG1 22
#define ADDR_DATA 27
#define SENT 17
#define ENABLE 3
#define BUSY 14
#define GATE 2
#define DEMO 16

Ulong rand_seed;

int gpio_list[] = {
	BIT0,
	BIT1,
	BIT2,
	BIT3,
	BIT4,
	BIT5,
	BIT6,
	BIT7,
	SEG0,
	SEG1,
	ADDR_DATA,
	SENT,
	ENABLE,
	BUSY,
  GATE,
	DEMO,
  -1
};

#define C0 0
#define D0 2
#define E0 4
#define F0 5
#define G0 7
#define A0 9
#define B0 11
#define C1 12
#define D1 14
#define E1 16
#define F1 17
#define G1 19
#define A1 21
#define B1 23
#define C2 24
#define D2 26
#define E2 28
#define F2 29
#define G2 31
#define A2 33
#define B2 35
#define C3 36
#define D3 38
#define E3 40
#define F3 41
#define G3 43
#define A3 45
#define B3 47
#define C4 48
#define D4 50
#define E4 52
#define F4 53
#define G4 55
#define A4 57
#define B4 59
#define C5 60
#define D5 62
#define E5 64
#define F5 65
#define G5 67
#define A5 69
#define B5 71
#define C6 72
#define D6 74
#define E6 76
#define F6 77
#define G6 79
#define A6 81
#define B6 83
#define C7 84
#define D7 86
#define E7 88
#define F7 89
#define G7 91
#define A7 93
#define B7 95
#define C8 96
#define D8 98
#define E8 100
#define F8 101
#define G8 103
#define A8 105
#define B8 107
#define MUTE 0
