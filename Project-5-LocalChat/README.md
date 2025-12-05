# Project 5 – Local Chat / Messaging System

## Description
A small LAN chat made with Python sockets.  
Multiple users can connect from the terminal and send messages in real time.  
Super lightweight and great for learning networking, sockets, and threads.

## Files
- `chat_server.py` – Manages clients + broadcasts messages  
- `chat_client.py` – Connects to server and sends/receives chat

## Requirements
- Linux OS  
- Python 3 installed  
- LAN or localhost  
- Uses:
  - `socket`
  - `threading`

## Features
- Multi-user terminal chat  
- Real-time message broadcasting  
- User join/leave notifications  
- Works on localhost or LAN  
- Simple, readable Python code

## Usage

### Start the server
```bash
python3 chat_server.py
