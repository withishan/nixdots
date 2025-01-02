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
    #language
    {
      padding: 6px 26px;
      border-radius: 16px;
      transition: none;
      color: #ffffff;
      background-color: #383c4a;
    }
    
    #battery.charging {
      color: #ffffff;
      background-color: #0E9464;
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

	modules-left = ["clock" "keyboard-state"];
	modules-center = ["niri/workspaces"];
	modules-right = ["network" "battery" "backlight" "pulseaudio"];

	"niri/workspaces" = {
	  "disable-scroll" = false;
	  "format" = "{icon}";
	};

	"keyboard-state" = {
	  numlock = false;
	  capslock = true;
	  format = {
	    capslock = "caps  {icon}";
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
          format = "{icon} {percent}%";
	  "format-icons" = [ "󰃞 " ];
	  tooltip = false;
	};

	battery = {
         format = "{icon} {capacity}%"; 
	 "format-charging" = "󰂄 {capacity}%";
	 "format-plugged" = "󰂄 {capacity}%";
	 "format-icons" = [ "󰂎" "󰁻" "󰁽" "󰁿" "󰂁" "󰁹" ];
	 tooltip = false;
	};

	pulseaudio = {
          format = "{icon}  {volume}%";
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
