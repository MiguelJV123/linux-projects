# Project 4 – Mini System Monitor / Dashboard

## Description
A real-time terminal dashboard that displays CPU, RAM, disk usage, and top processes.  
Demonstrates Linux system transparency using `/proc`, live metrics, ANSI colors, terminal control, and loops.

## Files
- `sys_dashboard.sh` – Main monitor script (colored + graphs)

## Requirements
- Linux OS
- Bash shell
- Tools used:
  - `free` (RAM info)
  - `df` (disk info)
  - `ps` (process list)
  - `/proc/stat` (CPU core statistics)
  - ANSI escape sequences for terminal control

## Features
- Real-time CPU, RAM, and Disk percentages  
- Colored ASCII bar graphs  
- “Top processes” live listing  
- Cursor hiding for clean dashboard  
- Minimal flicker rendering  
- Auto-refresh every second  

## Usage

### Make script executable
```bash
chmod +x sys_dashboard.sh
