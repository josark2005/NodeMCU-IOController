-- http
print("HTTP Server Runing")
httpServer:listen(80)
httpServer:use('/led', function(req, res)
    res:type('application/json')
    if (next(req.query) == nil) then
        res:send('{"status":outofquery"}')
    else
        local pin = req.query['pin']
        gpio.mode(pin, gpio.OUTPUT)
        blink(pin)
        res:send('{"status":"ok"}')
    end
    collectgarbage()
end)
httpServer:use('/api/getip', function(req, res)
    res:type('application/json')
    res:send('{"staip": "'..ip..'","apip":"'..wifi.ap.getip()..'"}')
    collectgarbage()
end)
httpServer:use('/api/getled', function(req, res)
    res:type('application/json')
    local led = {}
    for i=0,12 do
        led["pin"..i] = gpio.read(i)
    end
    res:send(sjson.encode(led))
    collectgarbage()
end)