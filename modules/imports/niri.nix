{ config, pkgs, lib, ... }: {
  programs.niri = { 
    settings = 
      let
        sh = cmd: [ "sh" "-c" (lib.escape [ "\"" ] cmd) ];
      in
    {

    input = {
      focus-follows-mouse.enable = true;
    };

     spawn-at-startup = [
       { command = sh "waybar"; }
       { command = sh "swww-daemon"; }
     ];

     prefer-no-csd = true;

     cursor = {
      theme = "macOS";
      size = 24;
     };

     animations = {
      slowdown = 0.8;
      window-open = {
        easing = {
          duration-ms = 160;
	         curve = "ease-out-expo";
        };
      };
     };

     layout = {
       gaps = 16;
       border.enable = false;
       focus-ring.enable = false;
       always-center-single-column = false;
     };

     window-rules = [
        {
          matches = [
            { app-id = "^.*$"; }
          ];
          draw-border-with-background = false;
	        geometry-corner-radius = {
              bottom-left = 5.0;
              bottom-right = 5.0;
              top-left = 5.0;
              top-right = 5.0;
           };
          clip-to-geometry = true;
          open-maximized = true;
          shadow = {
            enable = true;
            color = "#00000065";
            draw-behind-window = true;
            softness = 50;
            spread = 8;
            offset.x = 8;
            offset.y = 8;
          };
        }
        {
          matches = [
            { app-id = "com.mitchellh.ghostty"; }
          ];

          open-floating = true;
          default-column-width = { 
            fixed = 800; 
          };
          default-window-height = { 
            fixed = 540; 
          };
        }
        {
          matches = [
            { app-id = "org.gnome.Nautilus"; }
          ];

          open-floating = true;
          default-column-width = { 
            fixed = 800; 
          };
          default-window-height = { 
            fixed = 540; 
          };
        }
    ];

    layer-rules = [
      {
        matches = [
          { namespace = "waybar"; }
        ];

        shadow = {
          enable = false;
          color = "#00000002";
          draw-behind-window = true;
          softness = 40;
          spread = 10;
          offset.x = 1;
          offset.y = 1;
        };

        geometry-corner-radius = {
          bottom-left = 12.0;
          bottom-right = 12.0;
          top-left = 12.0;
          top-right = 12.0;
        };
      }
    ];

      binds = with config.lib.niri.actions;
      let
            cm = spawn "sh" "-c";
      in
      {
	      "XF86AudioRaiseVolume".action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+" ];
        "XF86AudioLowerVolume".action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-" ];
	      "XF86AudioMute".action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];
	      "XF86MonBrightnessUp".action.spawn = [ "brightnessctl" "set" "+5%" ];
        "XF86MonBrightnessDown".action.spawn = [ "brightnessctl" "set" "5%-" ];

	      "Super+Q".action = close-window;
	      "Super+F".action = maximize-column;
	      "Super+V".action = toggle-window-floating;

	      "Super+Equal".action = set-column-width "+5%";
	      "Super+Minus".action = set-column-width "-5%";

	      "Super+1".action = focus-workspace 1;
	      "Super+2".action = focus-workspace 2;
	      "Super+3".action = focus-workspace 3;
	      "Super+4".action = focus-workspace 4;
	      "Super+5".action = focus-workspace 5;
	      "Super+6".action = focus-workspace 6;
	      "Super+7".action = focus-workspace 7;
	      "Super+8".action = focus-workspace 8;
	      "Super+9".action = focus-workspace 9;
	      "Super+0".action = focus-workspace 10;

	      "Super+Shift+H".action = move-column-left;
	      "Super+Shift+L".action = move-column-right;

	      "Super+R".action = cm "rofi -show drun";
        "Super+T".action.spawn = "ghostty";

	      "Super+H".action = focus-column-left;
        "Super+L".action = focus-column-right;
        "Super+J".action = focus-window-down-or-column-left;
        "Super+K".action = focus-window-up-or-column-right;

	      "Print".action = cm ''grim -g "$(slurp)" - | wl-copy'';
      };
    };
  };
}
