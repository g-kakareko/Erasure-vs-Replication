#include <stdio.h>
#include <stdlib.h>
#include <string.h>



/*
takes in 2 arguements
First is the name of the file you should be reading from 
Second is the size of the internal buffer, jerasure seems to use a variable length buffer 

Error checking for:
bad file names (throws error)
and for if buffer > size of file (sets buffer = size)


*/



int main(int argc, char **argv)
{

if(argc !=3)
	{printf("./a.out fileName bufferSize\n");return 0;}
	

// printf("yee\n");
/*size of file*/
FILE *f = fopen(argv[1],"rb");

if (f == NULL) {
	fprintf(stderr,  "Unable to open file.\n");
	exit(0);
}

fseek(f,0,SEEK_END);
long size = ftell(f);
rewind(f);


/*getting various data points + memory*/
int buffer;
sscanf(argv[2],"%d",&buffer);
if(buffer > size) buffer = size;
char * block = (char *)malloc(sizeof(char)*buffer);
char f1[100];
char f2[100];
char f3[100];
strcpy(f1, argv[1]);
strcat(f1, "_data1");
strcpy(f2, argv[1]);
strcat(f2, "_data2");
strcpy(f3, argv[1]);
strcat(f3, "_data3");


FILE *ff1 = fopen(f1,"wb");
FILE *ff2 = fopen(f2,"wb");
FILE *ff3 = fopen(f3,"wb");



int n = 0;
int readins = size/buffer;


while(n < readins)
{
	fread(block,sizeof(char),buffer,f);
	fwrite(block,sizeof(char),buffer,ff1);
	fwrite(block,sizeof(char),buffer,ff2);
	fwrite(block,sizeof(char),buffer,ff3);
	++n;
}
/*left over data*/
int i;
if((i = size%buffer) != 0)

{	fread(block,sizeof(char),i,f);
	fwrite(block,sizeof(char),i,ff1);
	fwrite(block,sizeof(char),i,ff2);
	fwrite(block,sizeof(char),i,ff3);
}


free(block);
fclose(f);
fclose(ff1);
fclose(ff2);
fclose(ff3);
return 0;
}