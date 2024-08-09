using Sockets

# Define o endereço e a porta do servidor
server_address = "127.0.0.1"  # ou o endereço IP do servidor
server_port = 8080

# Conecta-se ao servidor
conn = connect(server_address, server_port)

try
    # Envia uma mensagem para o servidor
    println("Digite a mensagem para enviar ao servidor:")
    message = readline()  # Lê a entrada do usuário
    write(conn, message * "\n")  # Envia a mensagem com uma nova linha para o servidor
    
    # Recebe a resposta do servidor
    response = readline(conn)
    println("Resposta do servidor: $response")

finally
    # Fecha a conexão
    close(conn)
end
