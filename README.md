# bak
simple backup function for files and directories (Linux)

How to:
- save in .bashrc and source the file,
- syntax

`bak filename`

- works recursively with directories,

`bak dirname`

- works with both relative and absolute pathnames,
- resolves symbolic links,
- current date and unique number (here, until 99) are added to the filename, it could be modified to date & time instead,
- works with wildcards (for example, `bak *` or `bak filename*`), backups of backups are not created, new number is found,
- non-existing files are skipped,
- bak filename displayed upon successful backup,
- if used with git, .gitignore could be modified,
- backup can save your life ;)
