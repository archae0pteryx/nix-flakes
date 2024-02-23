#!/bin/bash
active_window_id=$(xdotool getactivewindow)
active_window_pid=$(xdotool getwindowpid "$active_window_id")
process=$(cat /proc/$active_window_pid/comm)
if [[ "$process" == "xterm" ]]; then
  xdotool key Control_L+Shift_L+v
else
  xdotool key --clearmodifiers Control_L+v
fi