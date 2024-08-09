using Sockets

function start_server(port)
    server = listen(port)
    println("Servidor ouvindo na porta $port...")
    
    while true
        conn = accept(server)
        println("Nova conexão estabelecida.")
        
        @async begin
            try
                while true
                    # Tenta ler uma linha do cliente
                    if !eof(conn)
                        line = readline(conn)
                        println("Recebido: $line")
                        # Ecoa a linha de volta para o cliente
                        write(conn, line * "\n")
                    else
                        break
                    end
                end
            catch err
                println("Conexão encerrada com erro: $err")
            finally
                close(conn)
                println("Conexão encerrada.")
            end
        end
    end
end

# Inicia o servidor na porta 8080
start_server(8080)
