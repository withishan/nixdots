{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    style = ''
    * {
      font-family: "Host Grotesk";
      font-size: 18px;
      font-weight: 800;
    }
    
    window {
      background: none;
      border-bottom: none;
    }

    #clock, 
    #audiolight, 
    #battery, 
    #network, 
    #pulseaudio,
    #backlight,
    #workspaces,
    #keyboard-state,
    #language,
    #tray,
    #window
    {
      padding: 6px 26px;
      border-radius: 16px;
      transition: none;
      color: #ECDFCC;
      background-color: #181C14;
    }

    window#waybar.empty #window {
      background-color: transparent;
    }
    
    #battery.charging {
      color: #181C14;
      background-color: #ECDFCC;
    }
    
    #battery.warning:not(.charging) {
      background-color: #ffbe61;
      color: black;
    }
    
    #battery.critical:not(.charging) {
      background-color: #f53c3c;
      color: #ECDFCC;
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }

    #workspaces button {
      color: #5a5c52;
      padding: 4px;
      border: none;
      box-shadow: none;
      text-shadow: none;
      background: #181C14;
    }
    
    #workspaces button.active {
      color: #ECDFCC;
    }
    '';
    settings = {
      mainbar = {
        layer = "top";
	      position = "top";
	      margin = "10 10 0 10";
	      spacing = 5;

	      modules-left = ["niri/window" "pulseaudio" "battery"];
	      modules-center = ["niri/workspaces" "clock" "keyboard-state"];
	      modules-right = ["network" "backlight"];

	      "niri/workspaces" = {
	        "disable-scroll" = false;
	        "format" = "{icon}";
	      };

        "niri/window" = {
          format = "{app_id}";
          rewrite = {
            "com.mitchellh.ghostty" = "ghostty";
          };
        };

	      "keyboard-state" = {
	        numlock = false;
	        capslock = true;
	        format = {
	          capslock = "caps   {icon}";
	        };
	        "format-icons" = {
	          locked = " ";
	          unlocked = " ";
	        };
	      };		
	      
	      "clock" = {
          format = "{:%a, %d %b, %I:%M %p}";
	        tooltip = false;
	      };

	      backlight = {
          format = "{icon}  {percent}%";
	        "format-icons" = [ "󰃞 " ];
	        tooltip = false;
	      };

        tray = {
          "icon-size" = 20;
        };

	      battery = {
          format = "{icon}  {capacity}%"; 
	        "format-charging" = "󰂅  {capacity}%";
          "format-plugged" = "󰂅  {capacity}%";
	        "format-icons" = [ "󰁺" "󰁼" "󰁾" "󰁹" ];
	        tooltip = false;
	      };

	      pulseaudio = {
          format = "{icon}   {volume}%";
	        "format-muted" = " ";
	        "format-icons" = {
	        default = [ " " ];
	        }; 
	        tooltip = false;
	      };

	      network = {
	        format = "{icon}";
	        "format-disconnected" = "󰤯 ";
	        "format-icons" = [ "󰤨 " ];
	        tooltip = false;
	      };
      };
    };
  };
}
