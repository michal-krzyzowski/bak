# bak
Simple backup script for files and directories in Linux, making the backup creation quicker than `cp -r [...]`

How to:
- save in **/bin/bak**
- add execution rights
- syntax

   `bak filename`

   `bak filename -c "optional comment"`

- works recursively with directories

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
- current date and time are added to the backup filename, the comment optionally as well
- backup filename is displayed upon completion
  
   `filename.bak_[DATE_AND_TIME]`

   `filename.bak_[DATE_AND_TIME]_[OPTIONAL_COMMENT]`
  
