# Project 6 – Automated Downloader / Organizer

## Description
A script that automatically downloads files from URLs (or monitors folders) and organizes everything into neat sub-folders based on file type or date.  
Great for automating your download workflow using Linux tools and pattern matching.

## Files
- `auto_download.sh` – Main script for downloading + organizing

## Requirements
- Linux OS  
- Bash shell  
- Tools used:
  - `wget` or `curl` (file downloads)
  - `mv` / `mkdir` (file organization)
  - `grep` / pattern matching
  - Cron (optional scheduled automation)

## Features
- Automatically downloads files from a list of URLs  
- Organizes files by:
  - File type (images, videos, pdfs, scripts, etc.)  
  - Or by date (YYYY-MM-DD folders)  
- Detects file extensions automatically  
- Creates folders on the fly if needed  
- Optional cron job for scheduled runs  
- Logs activity to a text file

## Usage

### 1. Make script executable
```bash
chmod +x auto_download.sh
