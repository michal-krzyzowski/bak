# bak
Simple backup script for files and directories in Linux, making the backup creation quicker than `cp -r [...]`

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
- works with wildcards, for instance, `bak *` or `bak filename*`
- backups of backups ("\*.bak*\") are not created
- non-existing files or directories are skipped
- current date and time are added to the filename
- backup filename or dirname, containing date and optionally the comment, is displayed upon successful backup
  
`filename.bak_[DATE_AND_TIME]`

`filename.bak_[DATE_AND_TIME]_[COMMENT]`
