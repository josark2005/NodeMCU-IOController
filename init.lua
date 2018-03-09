print("Welcome!")
-- files
require("ledblink")
require("httpserver")
dofile("http.lua")
-- init.lua
pin_wifi = 4
wifi_auto_conn = 1
ip = nil
-- wifi mode
wifi.setmode(wifi.STATIONAP)
-- ap
apcfg = {
    ssid = "node_wifi",
    pwd = "12345678"
}
wifi.ap.config(apcfg)
-- wifi connection
wificfg = {
    ssid = "",
    pwd = "",
    auto = true
}
wifi.sta.config(wificfg)
print("Configure Success!")
-- print ip address
wifi.eventmon.register(wifi.eventmon.STA_GOT_IP,function(t)
    ip = t.IP
    print(ip)
end)
-- wifi
wifi_tmr = 0    -- wifi pin tmr_id
wifi.sta.autoconnect(wifi_auto_conn)    -- auto connect
gpio.mode(pin_wifi,gpio.OUTPUT)
wifi.eventmon.register(wifi.eventmon.STA_CONNECTED,function(t)
    print("WIFI Connected")
    tmr.unregister(wifi_tmr)
    gpio.write(pin_wifi,gpio.LOW)
end)
wifi.eventmon.register(wifi.eventmon.STA_DISCONNECTED,function(t)
    print("WIFI Disonnected")
    tmr.alarm(wifi_tmr, 100, tmr.ALARM_AUTO, function()
        blink(pin_wifi)
    end)
end)
wifi.eventmon.register(wifi.eventmon.AP_STACONNECTED,function(t)
    print("AP Connected")
end)
