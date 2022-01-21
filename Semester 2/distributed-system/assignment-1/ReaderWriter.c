#include<stdio.h>
#include<pthread.h>

void *ReaderWriter(void *rno)
{
     printf("Hello from %d Reader Writer.\n",*((int *)rno));
}

int main()
{
     //pthread_t tid;
     printf("Before Thread\n");
     
     int number_of_readers=0,number_of_writers=0;
     
     printf("Enter number of readers : ");
     scanf("%d",&number_of_readers);
     
     printf("Enter number of writers : ");
     scanf("%d",&number_of_writers);

     pthread_t Readers[number_of_readers],Writers[number_of_writers];

     int i = 0;
     for(i=0;i<number_of_readers;i++)
          pthread_create(Readers[i],NULL,ReaderWriter,(void *)&Readers[i]);
     for(i=0;i<number_of_readers;i++)
          pthread_join(Readers[i],NULL);     
     
     //pthread_create(&tid,NULL,ReaderWriter,NULL);
     //pthread_join(tid,NULL);
     printf("After Thread\n");
     return 0;
}    