#!/bin/bash

# Path to the file
FILE="/jellyfin/jellyfin-web/main.jellyfin.bundle.js"

# Check if the file exists
if [ -f "$FILE" ]; then
    # Check if the specific line exists in the file
    if grep -q 'enableBackdrops:function(){return R}' "$FILE"; then
        echo "enableBackdrops:function(){return R}"
        echo ""
        echo "String found! Would you like to proceed with adding the changes? (y/n)"
        read -r response

        # Check if the user agrees to proceed with the change
        if [[ "$response" =~ ^[Yy]$ ]]; then
            # Replace the line with the new string
            sed -i 's/enableBackdrops:function(){return R}/enableBackdrops:function(){return E}/' "$FILE"
            echo "Line replaced successfully."

            # Check if the change was successful by looking for the updated line
            if grep -q 'enableBackdrops:function(){return E}' "$FILE"; then
                echo "Change confirmed: The line was successfully replaced."
            else
                echo "Change failed: The line was not updated."
            fi
        else
            echo "Change aborted by user."
        fi
    else
        echo "The specified line was not found."
    fi
else
    echo "File does not exist."
fi
