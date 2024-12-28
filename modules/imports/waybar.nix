{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    style = ''
    * {
      font-family: "JetBrainsMono Nerd Font";
      font-size: 18px;
      font-weight: bold;
    }
    
    window {
      background: none;
      border-bottom: none;
    }

    #clock, 
    #pulseaudio, 
    #backlight, 
    #battery, 
    #network, 
    #workspaces,
    #keyboard-state,
    #language
    {
      padding: 4px 16px;
      border-radius: 10px;
      transition: none;
      color: #ffffff;
      background: #383c4a;
    }

    #battery.charging {
      color: #ffffff;
      background-color: #26A65B;
    }
    
    #battery.warning:not(.charging) {
      background-color: #ffbe61;
      color: black;
    }
    
    #battery.critical:not(.charging) {
      background-color: #f53c3c;
      color: #ffffff;
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }

    #workspaces button {
      color: #99a0c6;
      padding: 4px;
      border: none;
      box-shadow: none;
      text-shadow: none;
      background: #383c4a;
    }
    
    #workspaces button.active {
      color: #ffffff;
    }
    '';
    settings = {
      mainbar = {
        layer = "top";
	position = "top";
	margin = "10 10 0 10";
	spacing = 5;

	modules-left = ["niri/workspaces" "keyboard-state" "niri/language"];
	modules-right = ["clock" "battery" "backlight" "pulseaudio" "network"];

	"niri/workspaces" = {
	  "disable-scroll" = false;
	  "format" = "{icon}";
	};

	"keyboard-state" = {
	  numlock = false;
	  capslock = true;
	  format = {
	    capslock = "caps {icon}";
	  };
	  "format-icons" = {
	    locked = " ";
	    unlocked = " ";
	  };
	};		

	"niri/language" = {
	  format = "{short}";
	};

	clock = {
          format = " {:%H:%M}";
	  tooltip = false;
	};

	backlight = {
          format = "{percent}";
	  tooltip = false;
	};

	battery = {
         format = "{icon} {capacity}"; 
	 "format-icons" = [ "󰂎" "󰁻" "󰁽" "󰁿" "󰂁" "󰁹" ];
	 tooltip = false;
	};

	pulseaudio = {
          format = "{icon} {volume}";
	  "format-muted" = " ";
	  "format-icons" = {
	    default = [ " " ];
	  }; 
	  tooltip = false;
	};

	network = {
	  format = "{icon}";
	  "format-ethernet" = " ";
	  "format-disconnected" = "󰤯 ";
	  "format-icons" = [ "󰤨 " ];
	  tooltip = false;
	};
      };
    };
  };
}
