static volatile unsigned int *Gpio = NULL;


void gpio_init()
{
	int fd = open("/dev/mem", O_RDWR | O_SYNC );
	void *gpio_map;
	if (fd == -1 ) {
		printf("cant open error.");
		exit(-1);
	}
	gpio_map = mmap(NULL, BLOCK_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, GPIO_BASE );
	if ((int)gpio_map == -1){
		printf("mmap error.");
		exit(-1);
	}
	close(fd);
	Gpio = (unsigned int *) gpio_map;
}


void gpio_configure( int pin, int mode )
{
	int index = pin / 10;
	unsigned int mask = ~(0x7 << ((pin%10) * 3));
	Gpio[index] = (Gpio[index] & mask) | ((mode&0x7)<<((pin % 10) * 3));
}


void gpio_set(int pin, int val)
{
	Gpio[( val ? 7 : 10 )] = 0x1 << pin;
}


int gpio_read(int pin)
{
	return (Gpio[13]&(0x1<<pin)) != 0;
}
