{ mod }: {
  "${mod}+space" = "exec exec rofi -show run";
  "${mod}+Return" = "exec xfce4-terminal";
  "${mod}+Tab" = "exec rofi -show combi run,window";
  "${mod}+Shift+j" = "move left";
  "${mod}+Shift+k" = "move down";
  "${mod}+Shift+l" = "move up";
  "${mod}+Shift+semicolon" = "move right";
}

# set $ws1 "1"
# set $ws2 "2"
# set $ws3 "3"
# set $ws4 "4"
# set $ws5 "5"
# set $ws6 "6"
# set $ws7 "7"
# set $ws8 "8"
# set $ws9 "9"
# set $ws10 "10"

# workspace $ws6 output DP-1
# workspace $ws7 output DP-1
# workspace $ws8 output DP-1
# workspace $ws9 output DP-1

# # switch to workspace
# bindsym $mod+1 workspace number $ws1
# bindsym $mod+2 workspace number $ws2
# bindsym $mod+3 workspace number $ws3
# bindsym $mod+4 workspace number $ws4
# bindsym $mod+5 workspace number $ws5
# bindsym $mod+6 workspace number $ws6
# bindsym $mod+7 workspace number $ws7
# bindsym $mod+8 workspace number $ws8
# bindsym $mod+9 workspace number $ws9
# bindsym $mod+0 workspace number $ws10

# # move focused container to workspace
# bindsym $mod+Shift+1 move container to workspace number $ws1
# bindsym $mod+Shift+2 move container to workspace number $ws2
# bindsym $mod+Shift+3 move container to workspace number $ws3
# bindsym $mod+Shift+4 move container to workspace number $ws4
# bindsym $mod+Shift+5 move container to workspace number $ws5
# bindsym $mod+Shift+6 move container to workspace number $ws6, workspace $ws6 focus
# bindsym $mod+Shift+7 move container to workspace number $ws7, workspace $ws7 focus
# bindsym $mod+Shift+8 move container to workspace number $ws8, workspace $ws8 focus
# bindsym $mod+Shift+9 move container to workspace number $ws9, workspace $ws9 focus
# bindsym $mod+Shift+0 move container to workspace number $ws10
