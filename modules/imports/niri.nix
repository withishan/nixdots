{ config, pkgs, lib, ... }: {
  programs.niri = { 
    settings = 
      let
        sh = cmd: [ "sh" "-c" (lib.escape [ "\"" ] cmd) ];
      in
    {
     spawn-at-startup = [
       { command = sh "waybar"; }
       { command = sh "swww-daemon"; }
     ];

     prefer-no-csd = true;

     animations = {
       slowdown = 1.0;
     };

     animations.window-open = {
       easing = {
         duration-ms = 300;
	 curve = "ease-out-quad";
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
              bottom-left = 12.0;
              bottom-right = 12.0;
              top-left = 12.0;
              top-right = 12.0;
           };
          clip-to-geometry = true;
        }
      ];

      binds = with config.lib.niri.actions;
      let
            shoot = spawn "sh" "-c";
      in
      {
	"XF86AudioRaiseVolume".action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+" ];
        "XF86AudioLowerVolume".action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-" ];
	"XF86AudioMute".action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];
	"XF86MonBrightnessUp".action.spawn = [ "brightnessctl" "set" "+5%" ];
        "XF86MonBrightnessDown".action.spawn = [ "brightnessctl" "set" "5%-" ];

	"Super+Q".action = close-window;
	"Super+F".action = maximize-column;
	"Super+Equal".action = set-column-width "+5%";
	"Super+Minus".action = set-column-width "-5%";

	"Super+1".action = focus-workspace 1;
	"Super+2".action = focus-workspace 2;
	"Super+3".action = focus-workspace 3;
	"Super+4".action = focus-workspace 4;

	"Super+D".action.spawn = "fuzzel";
        "Super+T".action.spawn = "ghostty";

	"Super+H".action = focus-column-left;
        "Super+L".action = focus-column-right;
        "Super+J".action = focus-window-down-or-column-left;
        "Super+K".action = focus-window-up-or-column-right;

	"Print".action = shoot ''grim -g "$(slurp)" - | wl-copy'';
      };
    };
  };
}
