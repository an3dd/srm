# srm

A secure version of the linux 'rm' command.

### DESCRIPTION

The script create a '.trash' directory in your /home/$USER and move here all files that you want to remove.


### USE

You can:
- move a file in your '.trash'
- list the '.trash' content
- to empty your '.trash'
- restore a file from your '.trash'

You can display available commands with 'srm -h'.


### ADVICE

Rename the script as 'srm' and move it into '.local/bin' (create it if doesn't exists).

Copy/Paste:

```
mkdir -p /home/$USER/.local/bin
mv srm.sh srm
mv srm /home/$USER/.local/bin
```

Now you can use it in any folder.
