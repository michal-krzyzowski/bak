# bak
simple backup function for files and directories (Linux)

How to:
- save in ~/.bashrc and source the file,
- syntax

`bak filename`

- works also recursively with directories,

`bak dirname`

- works with both relative and absolute pathnames,
- resolves symbolic links to targets,
- works with wildcards (for instance, `bak *` or `bak filename*`),
- backups of backups are not created,
- non-existing files are skipped,
- current date and unique number (up to 999) are added to the filename,
- bak filename is displayed upon successful backup,
- backup can save your life ;)
