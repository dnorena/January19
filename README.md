# Miniproject

# 

# Vagrantfile API/syntax version
# This Vagrant file creates an Ubuntu 16.04 instance with PHP 7.2, and Apache web server
# Please refer to provision.sh file for more details.
# The environment is availanble at http://phpdevbox.test.com or http://localhost:5051
# Support with dnorena99@gmail.com

Using DevOps best practices (repeatability, automation, self-service, and documentation) 

Setup and a PHP environment with web server
    Update the following settings:
        Create a phpinfo page, which we will use to verify the PHP environment settings
        sys_temp_dir to “/tmp/php/<<companyname>>”
        Set the file name to php_<<companyname>>_error.log; this is where script errors should be logged to

Write a script that will concatenate, do a group by and sort 64 1GB files into a single resulting file.
Assume you are given the path to a folder and the folder contains 64 files with the approximate size of each file to be 1GB. The output of the script should be a single file containing all the lines in all the 64 files so the resulting file would always be roughly 64GB. The order of the lines in the resulting file should be grouped by IP address and sorted by time within the group.

The names of the files should be of the format: hwFile1.log, hwFile2.log and so on till hwFile64.log
The format of the lines inside the file can be assumed to be the following: 74.125.196.102- <<companyname>>online [22/Feb/2015:06:25:02 +0000] "GET /xxx/xxx HTTP/1.1" 200 41174 "file:///" "Mozilla/4.0 (compatible; NativeHost)"
The name of the output file should be: hwOutputFile.log

The script should take 2 arguments, the first parameter will be the path of the folder that has the 64 1GB files and the second parameter will be the path of the folder where the resulting file will be created.
