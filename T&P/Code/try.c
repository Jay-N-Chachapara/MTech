#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int main()
{
     char *str;
     *str = (char*)malloc(sizeof(char)*50);
     gets(str);
     puts(str);
     return 0;
}