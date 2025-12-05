import socket
import threading
import sys

PORT = 5000

def receive_messages(sock):
    while True:
        try:
            msg = sock.recv(1024).decode()
            if msg:
                print(msg)
        except:
            print("Connection lost.")
            break

def main():
    server_ip = input("Server IP: ").strip()
    name = input("Your name: ").strip()
    if not server_ip:
        print("No server IP provided, exiting.")
        sys.exit(1)

    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.connect((server_ip, PORT))

    threading.Thread(target=receive_messages, args=(client,), daemon=True).start()

    try:
        while True:
            message = input()
            if message.lower() == "/quit":
                client.close()
                break
            full_message = f"{name}: {message}"
            client.send(full_message.encode())
    except KeyboardInterrupt:
        client.close()

if __name__ == "__main__":
    main()
