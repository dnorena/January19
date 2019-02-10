#!/usr/bin/env python
import operator, os, re, shutil, sys

'''
Function receives the path to a folder and the folder contains 64 files with the 
approximate size of each file to be 1GB. The output of the script should be a single 
file containing all the lines in all the 64 files so the resulting file would always 
be roughly 64GB. The order of the lines in the resulting file should be grouped by 
IP address and sorted by time within the group.

The names of the files should be of the format: hwFile1.log, hwFile2.log and so on till hwFile64.log
The format of the lines inside the file can be assumed to be the following: 74.125.196.102- showtimeonline [22/Feb/2015:06:25:02 +0000] "GET /xxx/xxx HTTP/1.1" 200 41174 "file:///" "Mozilla/4.0 (compatible; NativeHost)"
The name of the output file should be: hwOutputFile.log
'''
def writingresults(sourcepath, destinationpath, sortedlist):
    destinationfile="hwOutputFile.log"

    # check existance of destination path and file 
    if not os.path.isdir(destinationpath):
        os.mkdir(destinationpath)
    
    if os.path.isfile(destinationpath + "/" + destinationfile):
        with open(destinationpath + "/" + destinationfile, 'w+') as wfd:
            for item in sortedlist:
                print(sourcepath + "/" + item[0])
                with open(sourcepath + "/" + item[0],'rb') as fd:
                    shutil.copyfileobj(fd, wfd, 1024*1024*10)
                    #chunks of 10MB
                wfd.write('\n')

def readingfolder(sourcepath, destinationpath): 
    #validate existance of source path
    if not os.path.isdir(sourcepath):
        print("Source folder doesn't exist, please verify")
        sys.exit(1)

    names = [name for name in os.listdir(sourcepath)]
    mylist = []
    for workfile in names: 
        #validate file name to proces
        if re.match(r'\hwFile\d+\.log',workfile ):   
            filename =sourcepath+"/"+workfile        
            with open(filename, 'rb') as f:
                for line in f:
                    # grab ip address and date in brackets
                    ipaddress = re.search(r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}', line).group()
                    #print(ipaddress)
                    datetime = re.search(r'\d{1,2}/[ADFJMNOS]\w*/\d{4}:\d{2}:\d{2}:\d{0,2}', line).group()
                    mylist.append((workfile, ipaddress, datetime))
                    break
                    # create dictionary entry with ip, date and file name

    sortedlist = sorted(mylist, key=operator.itemgetter(1, 2))
    ##now process the list in one file
    if len(sortedlist) > 0:
        writingresults(sourcepath, destinationpath, sortedlist)
    else:
        print("There are no files to process with expected pattern name, in folder " + sourcepath)
        sys.exit(0)

# main process
# validate must have 2 arguments
if len(sys.argv)  != 3:
    print("Reading files sample project by dnorena99@gmail.com")
    print("usage:   {} SOURCE-FOLDER TARGET-FOLDER".format(sys.argv[0]))
    print('')
    print('The 2 commands return the same output:')
    print('example: {} /opt/STProject /opt/Results'.format(sys.argv[0]))
    sys.exit(1)

sourcepath=sys.argv[1]
destinationpath=sys.argv[2]
try:
    readingfolder(sourcepath, destinationpath)
    print("******Done, check results in this folder: " + destinationpath)
    files = os.listdir(destinationpath)
    for name in files:
        print("\n Output File: " + name )
        print(" Size: " + str(os.path.getsize(destinationpath)))
        print(" Location: " + destinationpath + "\hwOutputFile.log")
    sys.exit(0)
except KeyError:
    pass


