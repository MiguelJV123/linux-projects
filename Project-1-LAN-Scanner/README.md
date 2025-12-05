# Project 1 – LAN Scanner & Alerts

## Description
Detect devices on your LAN automatically and notify when new devices appear.  
Demonstrates Linux automation, networking, and scripting power.

## Files
- `scan_lan.sh` – Basic LAN scan, outputs devices to a file
- `scan_lan_auto.sh` – Automated scan with notifications and logging

## Requirements
- Linux OS
- `nmap` installed (`sudo apt install nmap`)
- `libnotify-bin` for desktop notifications (`sudo apt install libnotify-bin`)
- Optional: `mailutils` for email notifications

## Usage

### Basic Scan
```bash
bash scan_lan.sh
