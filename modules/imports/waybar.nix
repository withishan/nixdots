{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    style = "
    @import url('file:///home/ishan/.cache/wal/colors-waybar.css');

    * {
      font-family: 'Host Grotesk';
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
    #keyboard-state,
    #language,
    #tray,
    #window
    {
      padding: 6px 26px;
      border-radius: 20px;
      transition: none;
      color: @foreground;
      background-color: @background;
    }

    #workspaces {
      padding: 6px 20px 6px 18px;
      border-radius: 20px;
      transition: none;
      color: @foreground;
      background-color: @background;
    }

    window#waybar.empty #window {
      background-color: transparent;
      padding: 0px;
    }
    
    #battery.charging {
      color: @background;
      background-color: @foreground;
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

    #workspaces button {
      color: @color10;
      border: none;
      box-shadow: none;
      text-shadow: none;
      background: @background;
    }
    
    #workspaces button.active {
      color: @color15;
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
            "empty" = "";
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
