# bak
Simple backup function for files and directories (Linux)

How to:
- save in ~/.bashrc and source the file,
- syntax

`bak filename`

- works also recursively with directories

`bak dirname`

- works with both relative and absolute pathnames,
- resolves symbolic links to targets,
- works with wildcards (for instance, `bak *` or `bak filename*`),
- backups of backups are not created,
- non-existing files are skipped,
- current date and time are added to the filename,
- bak filename or dirname is displayed upon successful backup.
