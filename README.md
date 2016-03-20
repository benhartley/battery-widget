# Battery widget for Awesome

## Intro
Simple text widget showing remaining battery as a percentage.

## Prerequisites
Assumes you have `acpi` installed.

## Install
Copy this into your main Awesome config directory (often ~/.config/awesome):

``` sh
git clone git@github.com:benhartley/battery-widget /path/to/awesome/config
```

Then `require` the widget into your main `rc.lua` file and add it to your `right_layout` like so:

``` lua
local battery_widget = require('battery-widget')
right_layout:add(battery_widget)
```

# Usage
Shows your remaining battery as a percentage, alerts you when to go below 15%. Underneath the hood it just polls `acpi` every 10 seconds.

