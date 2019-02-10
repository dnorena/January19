<?php
      // Script opens unexisting file so it generates an error.
      $file=fopen("nonexistent.txt","r");
      //print content of error log
      header('Content-Type: text/plain');
      echo file_get_contents("/var/log/php_showtime_error.log");

 ?>