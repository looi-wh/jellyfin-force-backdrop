# Jellyfin Force Backdrops

A simple script to force backdrops for Jellyfin clients.
Tested on Jellyfin 10.10.3 stable.

Step 1: Get a root shell in Jellyfin
```shell
docker exec -it --user root jellyfin /bin/bash
```

Step 2: Find the `main.jellyfin.bundle.js` file
```shell
find / -type f -name "main.jellyfin.bundle.js"
```
You should see something like
```shell
...
/jellyfin/jellyfin-web/main.jellyfin.bundle.js
```

Step 2: Modify the script to target the file
```shell
FILE="/jellyfin/jellyfin-web/main.jellyfin.bundle.js"
```
Note: Replace accordingly to step 2

Step 3: Make it executable and run it!
```
chmod +x script.sh
./script.sh
```
Note: There is no backups created with this script. Do your own backups in case you want to revert!

There should be no need to restart server to apply the changes.

### Issues faced while applying script to docker (my own experience)
- No permission to edit file in docker terminal
    - Check if you are authenticated terminal as root!
