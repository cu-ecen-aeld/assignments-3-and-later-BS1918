#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[])
{

   //Connect to the syslog daemon
   openlog(argv[0], LOG_PID | LOG_CONS, LOG_USER);
   syslog(LOG_INFO, "Cheking number of arguments");

    if (argc != 3) {
        // Print usage message if the number of arguments is incorrect
        printf(" number of arguments is lessthan or greater than 3 \n 3 arguments are needed for the application to work \n");


        return 1; // Return with an error code
    }


   int num;
   FILE *fptr;

   // use appropriate location if you are using MacOS or Linux
 
   fptr = fopen(argv[1],"w");
   syslog(LOG_INFO, "opening the file for writing");



   if(fptr == NULL)
   {
      printf("Error!");   
      exit(1);             
   }

   fprintf(fptr, "%s \n",argv[2]);
   syslog(LOG_INFO, "Writing into file");


   fclose(fptr);
   syslog(LOG_INFO, "closed the file");

   return 0;
}