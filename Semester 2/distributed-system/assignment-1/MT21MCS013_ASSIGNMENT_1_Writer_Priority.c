#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>

sem_t wrt;
pthread_mutex_t mutex;
int cnt = 1;
int numreader = 0;

void *writer(void *wno)
{   
     sem_wait(&wrt);
     cnt = cnt+2;
     printf("Writer : modified cnt to %d\n",cnt);
     sem_post(&wrt);

}
void *reader(void *rno)
{   
     // Reader acquire the lock before modifying numreader
     pthread_mutex_lock(&mutex);
     numreader++;
     if(numreader == 1)
          sem_wait(&wrt); // If this id the first reader, then it will block the writer
     pthread_mutex_unlock(&mutex);
     // Reading Section
     printf("Reader : read cnt as %d\n",cnt);
     // Reader acquire the lock before modifying numreader
     pthread_mutex_lock(&mutex);
     numreader--;
     if(numreader == 0)
          sem_post(&wrt); // If this is the last reader, it will wake up the writer.
     pthread_mutex_unlock(&mutex);
}

int main()
{   

     unsigned int Readers = 0, Writers = 0;
     printf("Enter number of readers and writers\n");
     scanf("%d\n%d",&Readers,&Writers);

     printf("%d Readers and %d Writers.\n",Readers,Writers);
     // pthread_t read[Readers];
     pthread_t write[Writers];
     pthread_mutex_init(&mutex, NULL);

     sem_init(&wrt,0,1);

     for(int i = 0; i < Writers; i++) {
          pthread_create(&write[i], NULL, writer, NULL);
     }

     for(int j = 0; j< Readers; j++)
          reader(NULL);

     for(int i = 0; i < Writers; i++)
          pthread_join(write[i], NULL);

     pthread_mutex_destroy(&mutex);
     sem_destroy(&wrt);

     return 0;
     
}
