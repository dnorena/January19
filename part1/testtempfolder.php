<?php 
     // Generate a random temp file in sys_temp_folder
     $temp_file = tempnam(sys_get_temp_dir(), 'Testtempfile');
     echo $temp_file;
     $directory = '/path/to/my/directory';
     $scanned_directory = array_diff(scandir($directory), array('..', '.'));
 ?>
