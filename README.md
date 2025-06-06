# bak
Simple backup script for files and directories in Linux

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
`dirname.bak_[DATE]_[COMMENT]`
- the goal just making the backup creation quicker, nothing more than `cp -r (...)`
