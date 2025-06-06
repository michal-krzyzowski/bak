# bak
Simple backup script for files and directories in Linux

How to:
- save in **/bin/bak**
- add execution rights
- syntax

`bak filename`

- works recursively with directories as well

`bak dirname`

- works with both absolute and relative paths

`bak /dirname`

`bak ../dirname`

- resolves symbolic links
- works with wildcards, for instance, `bak *` or `bak filename*`
- backups of backups ("\*.bak*\") are not created
- non-existing files or directories are skipped
- current date and time are added to the filename
- backup filename or dirname is displayed upon successful backup
