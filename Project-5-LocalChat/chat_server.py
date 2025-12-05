import socket
import threading

HOST = "0.0.0.0"  # listen on all interfaces
PORT = 5000

clients = []

def broadcast(message, sender_socket):
    for client in clients:
        if client != sender_socket:
            try:
                client.send(message)
            except:
                try:
                    client.close()
                except:
                    pass
                if client in clients:
                    clients.remove(client)

def handle_client(client_socket, addr):
    print(f"[CONNECTED] {addr}")
    while True:
        try:
            message = client_socket.recv(1024)
            if not message:
                break
            broadcast(message, client_socket)
        except:
            break
    print(f"[DISCONNECTED] {addr}")
    if client_socket in clients:
        clients.remove(client_socket)
    try:
        client_socket.close()
    except:
        pass

def main():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server.bind((HOST, PORT))
    server.listen()
    print(f"[SERVER RUNNING] Listening on {HOST}:{PORT}")
    while True:
        client_socket, addr = server.accept()
        clients.append(client_socket)
        thread = threading.Thread(target=handle_client, args=(client_socket, addr), daemon=True)
        thread.start()

if __name__ == "__main__":
    main()
