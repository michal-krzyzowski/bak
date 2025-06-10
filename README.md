# bak
Simple backup script for files and directories in Linux, making the backup creation quicker than `cp -r filename filename.bak`. The only added value is making the whole process quicker.



**Setup**
- save in **/bin/bak**
- add execution rights



**Syntax**

- bak [FILENAME] [OPTIONAL_PARAMETERS]
  
   `bak filename`

   `bak filename -c "optional comment"`

   `bak -c "optional comment" filename`



**Features**

- it works recursively with directories

   `bak dirname`

- works with both absolute and relative paths

   `bak /dirname`

   `bak ../dirname`

   `bak .`

- resolves symbolic links
- works with wildcards
  
  `bak *`
  
  `bak filename*`
  
- backups of backups ("\*.bak*\") are not created
- non-existing files or directories are skipped



**Output**

- current date and time are added to the backup filename, optionally, the comment as well
- backup filename is displayed upon completion
  
   `filename.bak_[DATE_AND_TIME]`

   `filename.bak_[DATE_AND_TIME]_[OPTIONAL_COMMENT]`

- if the pwd is different than the location of the backup output, the path is also included

   `/path/filename.bak_[DATE_AND_TIME]`

   `/path/filename.bak_[DATE_AND_TIME]_[OPTIONAL_COMMENT]`
  



