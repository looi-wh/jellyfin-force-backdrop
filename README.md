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

Step 3: Replace `/jellyfin/jellyfin-web/main.jellyfin.bundle.js` with the path to `main.jellyfin.bundle.js` file and execute this command
```shell
f=/jellyfin/jellyfin-web/main.jellyfin.bundle.js; if [ -f "$f" ] && grep -q 'enableBackdrops:function(){return [^}]*}' "$f"; then read -p "String found! Replace with E? (y/n) " r && [[ $r =~ ^[Yy]$ ]] && sed -i 's/enableBackdrops:function(){return [^}]*}/enableBackdrops:function(){return E}/' "$f" && grep -q 'enableBackdrops:function(){return E}' "$f" && echo "Change confirmed: line updated." || echo "Change aborted or failed."; else echo "File missing or string not found."; fi
```
Note: There is no backups created with this script. Do your own backups in case you want to revert!

There should be no need to restart server to apply the changes.

### Issues faced while applying script to docker (my own experience)
- No permission to edit file in docker terminal
    - Check if you are authenticated terminal as root!
