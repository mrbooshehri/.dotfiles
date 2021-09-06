#! /usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 

# Launch bar1 and bar2
polybar bar 2>&1 | tee -a /tmp/polybar.log & disown

