# January19
The questions are meant to be straightforward, but don’t hesitate to ask if you have any questions. Reference books and Internet research are allowed unless otherwise specified, but please write ALL code yourself.
 
Use DevOps best practices (repeatability, automation, self-service, and documentation) complete the following two assignments. The assignments should utilize some type of free commonly available virtualization tool or platform (Docker, Vagrant,, Google Cloud, etc.) making the assignment self-contained. Each completed assignment should also include a README.md file detailing 1. how to execute the virtualized environment and 2. any arguments that may need to be passed. In doing this, please utilize README.md best practices.
 

    Setup and a PHP environment with your choice of web server

        Update the following settings:

            Create a phpinfo page, which we will use to verify the PHP environment settings
            sys_temp_dir to “/tmp/php/showtime”
            Set the file name to php_showtime_error.log; this is where script errors should be logged to
    Please write a script that will concatenate, do a group by and sort 64 1GB files into a single resulting file.

 
Assume you are given the path to a folder and the folder contains 64 files with the approximate size of each file to be 1GB. The output of the script should be a single file containing all the lines in all the 64 files so the resulting file would always be roughly 64GB. The order of the lines in the resulting file should be grouped by IP address and sorted by time within the group.
 

    The names of the files should be of the format: hwFile1.log, hwFile2.log and so on till hwFile64.log
    The format of the lines inside the file can be assumed to be the following: 74.125.196.102- showtimeonline [22/Feb/2015:06:25:02 +0000] "GET /xxx/xxx HTTP/1.1" 200 41174 "file:///" "Mozilla/4.0 (compatible; NativeHost)"
    The name of the output file should be: hwOutputFile.log

Please create a bash script with your firstname.lastname.sh (For example, Jane.Doe.sh). The script should take 2 arguments, the first parameter will be the path of the folder that has the 64 1GB files and the second parameter will be the path of the folder where the resulting file will be created.
