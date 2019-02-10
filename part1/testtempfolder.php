<?php 
    //  // Generate a random temp file in sys_temp_folder
    $temp_file = tempnam(sys_get_temp_dir(), 'Testtempfile');
    $directory = sys_get_temp_dir();    
    //Get a list of file paths using the glob function.
    $fileList = glob('/tmp/php/showtime/*');
    //Loop through the array that glob returned.
    foreach($fileList as $filename){
        //Simply print them out onto the screen.
        echo $filename, '<br>'; 
    }
 ?>


