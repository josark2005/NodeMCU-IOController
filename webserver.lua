-- web server
function ws_listen(port)
    print("Web Server starting")
    port = port or 80
    srv = net.createServer(net.TCP)
    srv:listen(port, function(conn)
        --conn:on("receive", function(skt, msg)
        --    print(msg)
        --end)
        conn:send("HTTP/1.1 200 OK hello world")
    end)
end