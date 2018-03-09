-- led blink module
function blink(pin)
    local status = gpio.read(pin)
    if status == gpio.HIGH then 
        gpio.write(pin, gpio.LOW)
    else
        gpio.write(pin, gpio.HIGH)
    end
end
