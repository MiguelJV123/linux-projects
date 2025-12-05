#!/bin/bash
# backup.sh – Personal File Backup System

# Load config
source ./config.sh

# Create backup destination if it doesn't exist
mkdir -p "$DESTINATION"

# Create timestamped backup folder
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FOLDER="$DESTINATION/backup_$TIMESTAMP"
mkdir -p "$BACKUP_FOLDER"

# Loop through source folders and copy
for FOLDER in $SOURCE_FOLDERS; do
    if [ -d "$FOLDER" ]; then
        cp -r "$FOLDER" "$BACKUP_FOLDER"
        echo "Backed up $FOLDER"
    else
        echo "Folder $FOLDER does not exist!"
    fi
done

# Log backup
echo "$(date): Backup completed to $BACKUP_FOLDER" >> backup_logs/backup_log.txt

# Optional: send email notification (requires mailutils configured)
# echo "Backup completed to $BACKUP_FOLDER" | mail -s "Backup Complete" $EMAIL
