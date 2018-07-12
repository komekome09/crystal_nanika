require "http/web_socket"

puts "open socket"
socket = HTTP::WebSocket.new("wss://echo.websocket.org/")

spawn do
    while true
        msg = gets()
        if msg
            socket.send(msg)
        end
    end
end

socket.on_message do |message|
    puts "[#{Time.now}]: #{message}"
end

socket.run
