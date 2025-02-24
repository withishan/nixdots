{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    style = "
    @import url('file:///home/ishan/.cache/wal/colors-waybar.css');

    * {
      font-family: 'Host Grotesk';
      font-size: 18px;
      font-weight: 800;
      border: none;
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
    #keyboard-state,
    #language,
    #tray,
    #window
    {
      padding: 6px 26px;
      border-radius: 20px;
      transition: none;
      color: @foreground;
      background: alpha(@background, 0.8);
    }

    #workspaces {
      padding: 6px 20px;
      border-radius: 20px;
      transition: none;
      color: @foreground;
      background: alpha(@background, 0.8);
    }

    #workspaces button {
      margin-left: 2px; 
      margin-right: 2px;
      padding: 4px 6px 4px 2px;
      color: @color12;
      border: none;
      box-shadow: none;
      text-shadow: none;
      background: none;
    }
    
    #workspaces button.active {
      color: @color4;
    }

    #workspaces button.persistent {
      color: @color11;
    }

    window#waybar.empty #window {
      background-color: transparent;
      padding: 0px;
    }
    
    #battery.charging {
      color: @background;
      background: alpha(@foreground, 0.8);
    }
    
    #battery.warning:not(.charging) {
      background-color: #ffbe61;
      color: black;
    }
    
    #battery.critical:not(.charging) {
      background-color: #f53c3c;
      color: #f7f7f7;
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }
    ";
    settings = {
      mainbar = {
        layer = "top";
	      position = "top";
	      margin = "10 10 0 10";
	      spacing = 5;

	      modules-left = ["keyboard-state" "hyprland/workspaces" "clock"];
	      modules-center = ["hyprland/window"];
	      modules-right = ["pulseaudio" "network" "battery" "backlight"];

	      "hyprland/workspaces" = {
          "format" = "{icon}";
          "format-icons" = {
            "active" = "";
            "default"= "";
          };
          "persistent-workspaces" = {
            "*" = 3;
          };
	      };

        "hyprland/window" = {
          "format" = "{}";
          "max-length" = 30;
          "separate-outputs" = true;
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
	        "format-icons" = [ "󰁺" "󰁼" "󰁾" "󰂀" "󰂂" "󰁹" ];
	        tooltip = false;
          interval = 2;
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
