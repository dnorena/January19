# Miniproject ST


This Vagrant file creates an Ubuntu 16.04 instance with PHP 7.2, and Apache web server, Please refer to provision.sh file for more details.
The environment is availanble at http://phpdevbox.test.com or http://localhost:1234 for more support with dnorena99@gmail.com


<h3>How to Install</h3>
Pre-Requisites

    Virtual Box installed in your computer.
    Hashicorp-Vagrant Installed in your system.
    Download Git for Windows.
   
<h3>Running the program, Solution Part 1 (PHP Env.)</h3>

- It has been tested with [Vagrant](https://www.vagrantup.com/) 2.0.1 and [VirtualBox](https://www.virtualbox.org/) 5.2.2, but you may use latest versions.
- Execute windows command prompt as administrator.
- CD into your local working folder.
- Download the repo locally in your windows machine.
  -  `git clone https://github.com/dnorena/sampleprj`
  -  `cd sampleprj` folder. This was created by git clone operation
  - `vagrant up` # wait for few seconds. This launches ubuntu box
  - `vagrant ssh` # to connect to the system

- The site is available at these locations
  -  (http://phpdevbox.test.com/) or (http://localhost:1234) or (http://192.168.3.11)
 

 <h3>Running the program, Solution Part 2 (Files Processing Script)</h3>

- Use the same ubuntu box from Part 1. to execute Python script called diego.norena.py.   The script requires two parameters, sourcepath and destination path.  for example:
  - cd into your working folder sampleprj directory
  - `vagrant ssh`
  - From command line inside your vagrant ubuntu box. `cd /opt/ProjectST/part2`
  - Execute the program. `python diego.norena /vagrant results`
  - The first parameter is the source directory where the files to be processed are located and the second parameter is the target folder to save results.  

<h2>Problem Description </h2>

Part 1. Setup a PHP environment with web server

- Update the following settings:<BR>
    a. Create a phpinfo page, which we will use to verify the PHP environment settings<BR>
    b. sys_temp_dir to “/tmp/php/companyname”<BR>
    c. Set the file name to php_companyname_error.log; this is where script errors should be logged to

Part 2. Write a script that will concatenate, do a group by and sort 64 1GB files into a single resulting file.

- Assume you are given the path to a folder and the folder contains 64 files with the approximate size of each file to be 1GB. The output of the script should be a single file containing all the lines in all the 64 files so the resulting file would always be roughly 64GB. The order of the lines in the resulting file should be grouped by IP address and sorted by time within the group.

- The names of the files should be of the format: hwFile1.log, hwFile2.log and so on till hwFile64.log


- The format of the lines inside the file can be assumed to be the following: 74.125.196.102- companynameonline [22/Feb/2015:06:25:02 +0000] "GET /xxx/xxx HTTP/1.1" 200 41174 "file:///" "Mozilla/4.0 (compatible; NativeHost)"
The name of the output file should be: hwOutputFile.log

- The script should take 2 arguments, the first parameter will be the path of the folder that has the 64 1GB files and the second parameter will be the path of the folder where the resulting file will be created.




