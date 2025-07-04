#!/bin/bash

# Get the currently focused application
focused_app=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true')

# Check if WezTerm is the focused app
if [ "$focused_app" = "WezTerm" ]; then
    # Hide WezTerm using System Events
    osascript -e 'tell application "System Events" to set visible of process "WezTerm" to false'
else
    # Launch or focus WezTerm if it's not focused
    open -a /Applications/WezTerm.app
fi