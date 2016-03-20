local wibox = require("wibox")

local widget = wibox.widget.textbox()    
local poll = timer({timeout = 10})    

widget:set_text(" | Battery | ")    

poll:connect_signal("timeout",    
function()    
    local fh = assert(io.popen("acpi | cut -d, -f 2 -", "r"))    
    widget:set_text(" |" .. fh:read("*l") .. " | ")    
    fh:close()    
end    
)    
poll:start()

return widget
