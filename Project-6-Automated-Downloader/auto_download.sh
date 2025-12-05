#!/bin/bash

# auto_download.sh
# Automatically downloads files from a list of URLs and organizes them

# ===== CONFIG =====
DOWNLOAD_LIST="urls.txt"   # A text file containing one URL per line
DOWNLOAD_DIR="$HOME/Downloads/auto_downloads"
LOG_FILE="$DOWNLOAD_DIR/download_log.txt"
ORGANIZE_BY="type"   # options: type | date

mkdir -p "$DOWNLOAD_DIR"

echo "===== Download started: $(date) =====" >> "$LOG_FILE"

while read -r url; do
    [ -z "$url" ] && continue
    echo "Downloading $url..."
    wget -q -P "$DOWNLOAD_DIR" "$url"
    if [ $? -eq 0 ]; then
        echo "$(date): Successfully downloaded $url" >> "$LOG_FILE"
        
        file_name=$(basename "$url")
        if [ "$ORGANIZE_BY" == "type" ]; then
            ext="${file_name##*.}"
            folder="$DOWNLOAD_DIR/$ext"
        else
            folder="$DOWNLOAD_DIR/$(date +%F)"
        fi
        
        mkdir -p "$folder"
        mv "$DOWNLOAD_DIR/$file_name" "$folder/"
    else
        echo "$(date): Failed to download $url" >> "$LOG_FILE"
    fi
done < "$DOWNLOAD_LIST"

echo "===== Download finished: $(date) =====" >> "$LOG_FILE"
echo "All done! Files saved in $DOWNLOAD_DIR"
