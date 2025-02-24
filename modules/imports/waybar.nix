{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    style = "
    @import url('file:///home/ishan/.cache/wal/colors-waybar.css');

    * {
      color: @color5;
      font-family: 'Host Grotesk';
      font-weight: 700;
      font-size: 20px;
      min-width: 18px;
      border: none;
      border-radius: 0;
      box-shadow: none;
      text-shadow: none;
      padding: 0px;
    }
    
    window {
      background: none;
      border-bottom: none;
      border: 2px solid darker(@color5);
      border-radius: 10px;
      background: alpha(@background, 0.7);
    }

    #ws {
      margin: 0px 8px;
      padding-left: 2px;
      padding-right: 2px;
      border-radius: 8px;
      background: alpha(darker(@color5), 0.4);
    }

    #backlight {
      margin-top: 5px;
      margin-bottom: 5px;
    }

    #battery {
      margin-top: 5px;
      margin-bottom: 10px;
    }

    #pulseaudio {
      margin-top: 5px;
      margin-bottom: 5px;
    }

    #network {
      margin-top: 2px;
      margin-bottom: 2px;
      padding: 2px 0px;
      border-radius: 8px;
      background-color: alpha(lighter(@color5), 0.2);
    }

    #workspaces {
      margin: 8px 8px 0px 8px;
      padding: 2px 0px;
      border-radius: 8px;
      transition: none;
      background: alpha(darker(@color5), 0.4);
    }

    #clock {
      margin: 0px 8px;
      padding: 5px 8px;
      border-radius: 8px;
      transition: none;
      background: alpha(darker(@color5), 0.4);
    }

    #battery {
      margin: 0px 8px 8px 8px;
      padding: 10px 8px;
      border-radius: 8px;
      transition: none;
      background: alpha(darker(@color5), 0.4);
    }

    #backlight {
      margin: 0px 8px;
      padding: 6px 8px;
      border-radius: 8px;
      transition: none;
      background: alpha(darker(@color5), 0.4);
    }

    #workspaces button {
      margin-left: 2px; 
      margin-right: 2px;
      border-radius: 8px;
      background: none;
    }
    
    #workspaces button.active {
      color: lighter(@color5);
      background-color: alpha(lighter(@color5), 0.2);
    }

    window#waybar.empty #window {
      background-color: transparent;
      padding: 0px;
    }
    ";
    settings = {
      mainbar = {
        layer = "top";
	      position = "left";
	      margin = "20 0 20 5";
        spacing = 5;

	      modules-left = ["hyprland/workspaces"];
	      modules-center = [""];
	      modules-right = ["clock" "group/ws" "backlight" "battery"];

        "custom/smallspacer" = {
          "format" = " ";
        };

	      "hyprland/workspaces" = {
          "format" = "{icon}";
          "persistent-workspaces" = {
            "*" = 3;
          };
	      };

        "hyprland/window" = {
          "format" = "{}";
          "max-length" = 30;
          "separate-outputs" = true;
        };

	      "clock" = {
          format = "{:%H\n%M}";
	        tooltip = false;
	      };

	      backlight = {
          format = "{icon}";
	        "format-icons" = [ "󰃞 " ];
	        tooltip = false;
	      };

        tray = {
          "icon-size" = 20;
        };

        "group/ws" = {
          "orientation" = "inherit";
          "modules" = ["network" "pulseaudio"];
        };

	      battery = {
          format = "{icon}"; 
          "rotate" = 270;
          "format-charging" = "<b>{icon} </b>";
	        "format-icons" = [ "󰁺" "󰁼" "󰁾" "󰂀" "󰂂" "󰁹" ];
          "format-full" = "<span color='#82A55F'><b>{icon}</b></span>";
	        tooltip = false;
          interval = 2;
	      };

	      pulseaudio = {
          format = "{icon}";
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
