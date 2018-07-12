require "http/server"

class MyHandler
    include HTTP::Handler

    def call(context)
        context.response.content_type = "text/plain"
        context.response.print "Hi: #{Time.now}"

        next : Nil
    end
end

server = HTTP::Server.new([MyHandler.new,HTTP::LogHandler.new, HTTP::ErrorHandler.new])

server.bind_tcp 8080 
puts "Listening on http://127.0.0.1:8080"
server.listen
