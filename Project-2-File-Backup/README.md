# Project 2 – Personal File Backup System

## Description
Automatically backup important folders to a destination folder with timestamped directories.  
Demonstrates Linux file management, automation, and cron scheduling.

## Files
- `backup.sh` – Main backup script
- `config.sh` – Configuration file for source folders, backup location, email notifications
- `backup_logs/` – Logs of backup operations

## Requirements
- Linux OS
- Optional: `mailutils` for email notifications

## Usage
1. Edit `config.sh` to set folders and backup destination.
2. Run manually:
```bash
./backup.sh
