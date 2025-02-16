{ config, pkgs, lib, ... }: {
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland = {
    settings = {
      monitor = ",preferred,auto,1.0";

      "$terminal" = "ghostty";
      "$fileManager" = "nautilus";
      "$menu" = "fuzzel";

      exec-once = [
        "waybar" 
        "swww-daemon" 
        "hyprctl setcursor macOS 24"
      ];

      env = [
        "XCURSOR_THEME,macOS" 
        "XCURSOR_SIZE,24"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(808080ee)";
        "col.inactive_border" = "rgba(595959aa)";
      };

      decoration = {
        rounding = 15;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 19;
          offset = "0 1";
          render_power = 5;
          color = "rgba(0, 0, 0, 0.3)";
        };

        blur = {
          enabled = true;
          size = 10;
          passes = 3;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = "true";

        animation = [
          "global, 1, 4, default"
          # "windows, 1, 3.5, overshot, popin 80%"
          "windowsIn, 1, 3, overshot, popin 90%"
          "windowsOut, 1, 1.49, overshot, popin 87%"
          "workspaces, 1, 3, easeOutQuint, slide"
          "workspacesIn, 1, 5, easeOutQuint, slide"
          "workspacesOut, 1, 5, easeOutQuint, slide"
        ];

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "overshot,0.05,0.9,0.1,1.1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper = 1;
        disable_hyprland_logo = true;
      };

      input = {
        touchpad = {
          natural_scroll = true;
        };
      };

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, T, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $filemanager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, W, togglesplit,"

        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, J, movefocus, u"
        "$mainMod, K, movefocus, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        '', Print, exec, grim -g "$(slurp -d)" - | wl-copy''
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
"
",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
",XF86MonBrightnessDown, exec, brightnessctl s 10%-
"
      ];

      windowrule = [
        "float, ^(org.gnome.Nautilus)$"
        "opacity 0.8 override, ^(org.gnome.Nautilus)$"
        "float, ^(com.mitchellh.ghostty)$"
        "opacity 0.7 override, ^(com.mitchellh.ghostty)$"
        "opacity 0.8 override, ^(vesktop)$"
        "opacity 0.8 override, ^(Spotify)$"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
}
