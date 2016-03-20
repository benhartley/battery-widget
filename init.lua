local wibox = require("wibox")
local naughty = require("naughty")

local widget = wibox.widget.textbox()    
local poll = timer({timeout = 10})    

widget:set_text(" | Battery | ")    

poll:connect_signal("timeout",    
function()    
    local fh = assert(io.popen("acpi | cut -d, -f 2 -", "r"))    
    local percentage = string.gsub(fh:read("*l"), "%s+", "")
    local as_num = string.gsub(percentage, "%%", "")

    if tonumber(as_num) < 16 then
        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Battery",
            text = "Recharge / suspend now",
            timeout = 10
        })
        widget:set_markup(' | <span color="red">' .. percentage .. '</span> | ')
    else
        widget:set_text(" | " .. percentage .. " | ")
    end

    fh:close()    
end    
)    
poll:start()

return widget
