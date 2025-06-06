# bak
Simple backup script for files and directories in Linux, just making the backup creation quicker than `cp -r [...]`

How to:
- save in **/bin/bak**
- add execution rights
- syntax

   `bak filename`

   `bak filename -c "optional comment"`

- works recursively with directories as well

   `bak dirname`

   `bak dirname -c "optional comment"`

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
- current date and time are added to the filename, the comment is optional
- backup filename is displayed upon successful backup
  
   `filename.bak_[DATE_AND_TIME]`

   `filename.bak_[DATE_AND_TIME]_[OPTIONAL_COMMENT]`
  
