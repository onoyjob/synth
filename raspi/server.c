#include "head.h"

int main() {
	int i = 0;
	int sockfd;
	int client_sockfd;
	struct sockaddr_in addr;

	rand_seed = time(NULL);
	//gpioの設定
	gpio_init();
	while( gpio_list[i] != -1 )
		gpio_configure( gpio_list[i++], GPIO_OUTPUT);

	socklen_t len = sizeof( struct sockaddr_in );
	struct sockaddr_in from_addr;

	char buf[1024];

	// 受信バッファ初期化
	memset( buf, 0, sizeof( buf ) );

	// ソケット生成
	if( ( sockfd = socket( AF_INET, SOCK_STREAM, 0 ) ) < 0 ) {
		perror( "socket" );
	}

	// 待ち受け用IP・ポート番号設定
	addr.sin_family = AF_INET;
	addr.sin_port = htons( 58276 );
	addr.sin_addr.s_addr = INADDR_ANY;

	// バインド
	if( bind( sockfd, (struct sockaddr *)&addr, sizeof( addr ) ) < 0 ) {
		perror( "bind" );
	}

	while(1){
		printf("waiting for client's connection..\n");
		// 受信待ち
		if( listen( sockfd, SOMAXCONN ) < 0 ) {
			perror( "listen" );
		}

		// クライアントからのコネクト要求待ち
		if( ( client_sockfd = accept( sockfd, (struct sockaddr *)&from_addr, &len ) ) < 0 ) {
			perror( "accept" );
		}

		// 受信
		int rsize;
		while( 1 ) {
			rsize = recv( client_sockfd, buf, sizeof( buf ), 0 );

			if ( rsize == 0 ) {
				break;
			} else if ( rsize == -1 ) {
				//perror( "recv" );
			break;
			} else {
				printf( "receive:%s\n", buf );
				//sleep( 1 );

			manage_data(buf);

				// 応答
				printf( "send:OK.\n");
				write( client_sockfd, "OK.", 4 );
			}
		}
		// ソケットクローズ
		close( client_sockfd );
	}
	// ソケットクローズ
	close( client_sockfd );
	close( sockfd );

	return 0;
}


void manage_data(char *buf)
{
	char modulename[10];
	char value[10];
	int i = 0, j = 0, bpm;
	pid_t pid;

	if(*buf == 'd'){
		while(*(buf+i+2) != ' ' ){
			value[i] = *(buf+(i+2));
			i++;
		}
		value[i] = '\0';
		bpm = atoi(value);
		if(bpm){
			pid = fork();
			switch(pid){
				case -1:printf("can not fork.\n");
					return;
				case 0:	demo(bpm);
					exit(EXIT_SUCCESS);
				default: return;
			}
		} else {
			gpio_set(DEMO,0);
		}
		return;
	}

	if(*buf == 'g'){
		if(*(buf+2) == '0'){
			GATE_ON();
			GATE_OFF();
			return;
		} else if(*(buf+2) == '1'){
			GATE_ON();
			return;
		} else if(*(buf+2) == '2'){
			GATE_OFF();
			return;
		}
	}

	if(*buf >= 'A' && *buf <= 'L'){
		printf("chord(%c,%c)\n",*buf,*(buf+2));
		chord(*buf,*(buf+2));
		return;
	}

	if(*buf == 'P'){
		system("poweroff");
		return;
	}

	while(*(buf+i) != ' ' ){
		modulename[i] = *(buf+i);
		i++;
	}
	modulename[i] = '\0';
	while(*(buf+i) == ' ' ){
		i++;
	}
	while(*(buf+i) != ' ' ){
		value[j] = *(buf+i);
		i++;
		j++;
	}
		value[j] = '\0';

			printf( "fpga_ctrl(%s,%s)\n", modulename,value );
	fpga_ctrl(atoi(modulename),(Ulong)atoi(value));
}
