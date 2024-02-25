{ mod }: {
  "${mod}+space" = "exec rofi -show run";
  "${mod}+Return" = "exec xfce4-terminal";
  "${mod}+Tab" = "exec rofi -show combi run,window";
  "${mod}+Shift+j" = "move left";
  "${mod}+Shift+k" = "move down";
  "${mod}+Shift+l" = "move up";
  "${mod}+Shift+semicolon" = "move right";
  "${mod}+h" = "focus left";
  "${mod}+j" = "focus down";
  "${mod}+k" = "focus up";
  "${mod}+l" = "focus right";
  "${mod}+v" = "split v";
  "${mod}+Shift+v" = "split h";
  "${mod}+Shift+q" = "kill";
}
