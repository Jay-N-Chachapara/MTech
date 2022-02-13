#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>

sem_t wrt;
pthread_mutex_t mutex;
int cnt = 1;
int numwriter = 0;

void *writer(void *wno)
{   
     pthread_mutex_lock(&mutex);
     numwriter++;
     if(numwriter == 1)
          sem_wait(&wrt);
     pthread_mutex_unlock(&mutex);
     //Writing Section
     cnt = cnt+1;
     printf("Writer : modified cnt to %d\n",cnt);
     pthread_mutex_lock(&mutex);
     numwriter--;
     if(numwriter == 0)
          sem_post(&wrt);
     pthread_mutex_unlock(&mutex);

}
void *reader(void *rno)
{   
     sem_wait(&wrt);
     // Reading Section
     printf("Reader : read cnt as %d\n",cnt);
     // Reader acquire the lock before modifying numreader
     sem_post(&wrt);
}

int main()
{   

     unsigned int Readers = 0, Writers = 0, i = 0,j = 0;
     printf("Enter number of readers and writers\n");
     scanf("%d\n%d",&Readers,&Writers);

     printf("%d Readers and %d Writers.\n",Readers,Writers);
     pthread_t read[Readers];
     pthread_t write[Writers];
     pthread_mutex_init(&mutex, NULL);

     sem_init(&wrt,0,1);

     for(int j = 0; j < Writers; j++)
          pthread_create(&write[j], NULL, writer, NULL);

     for(i = 0; i < Readers; i++)
          pthread_create(&read[i], NULL, reader, NULL);

     for(int j = 0; j< Readers; j++)
          pthread_join(read[j], NULL);

     for(int i = 0; i < Writers; i++)
          pthread_join(write[i], NULL);

     pthread_mutex_destroy(&mutex);
     sem_destroy(&wrt);

     return 0;
     
}
