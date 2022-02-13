#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>

sem_t wrt;
pthread_mutex_t mutex;
int cnt = 1;
int numreader = 0;

void *writer()
{   
     sem_wait(&wrt);
     cnt = cnt+1;
     printf("Writer : modified shared content to %d\n",cnt);
     sem_post(&wrt);

}
void *reader()
{   
     // Reader acquire the lock before modifying numreader
     pthread_mutex_lock(&mutex);
     numreader++;
     if(numreader == 1)
          sem_wait(&wrt); // If this id the first reader, then it will block the writer
     pthread_mutex_unlock(&mutex);
     // Reading Section
     printf("Reader : read shared content as %d\n",cnt);
     // Reader acquire the lock before modifying numreader
     pthread_mutex_lock(&mutex);
     numreader--;
     if(numreader == 0)
          sem_post(&wrt); // If this is the last reader, it will wake up the writer.
     pthread_mutex_unlock(&mutex);
}

int main()
{   

     unsigned int Readers = 0, Writers = 0,i = 0,j = 0;
     printf("Enter number of readers and writers\n");
     scanf("%d\n%d",&Readers,&Writers);

     printf("%d Readers and %d Writers.\n",Readers,Writers);
     pthread_t read[Readers],write[Writers];

     pthread_mutex_init(&mutex, NULL);

     sem_init(&wrt,0,1);
     
     for(i = 0; i < Readers; i++)
          pthread_create(&read[i], NULL, reader, NULL);
     
     for(j = 0; j < Writers; j++)
          pthread_create(&write[j], NULL, writer, NULL);

     for(int j = 0; j< Writers; j++)
          pthread_join(write[j], NULL);

     for(int i = 0; i < Readers; i++)
          pthread_join(read[i], NULL);

     

     pthread_mutex_destroy(&mutex);
     sem_destroy(&wrt);

     return 0;
     
}
