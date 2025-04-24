{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    style = "
    @import url('./colors.css');

    * {
      font-family: 'MartianMono Nerd Font';
      font-weight: 400;
      font-size: 20px;
      min-width: 18px;
      border: none;
      border-radius: 0;
      box-shadow: none;
      text-shadow: none;
      padding: 0px;
    }
    
    window#waybar {
      background: none;
      border-bottom: none;
      box-shadow: none;
    }

    #clock {
      color: @secondary;
      padding: 8px 14px;
      border: 2px solid alpha(@secondary_container, 0.5);
      border-radius: 0px;
      transition: none;
      background: @surface_container_low;
    }

    #connections {
      color: @secondary;
      padding: 8px 14px;
      border: 2px solid alpha(@secondary_container, 0.5);
      border-radius: 0px;
      transition: none;
      background: @surface_container_low;
    }

    #others {
      color: @secondary;
      padding: 8px 14px;
      border: 2px solid alpha(@secondary_container, 0.5);
      border-radius: 0px;
      transition: none;
      background: @surface_container_low;
    }

    #workspaces {
      padding: 8px 14px;
      border: 2px solid alpha(@secondary_container, 0.5);
      border-radius: 0px;
      transition: none;
      background: @surface_container_low;
    }

    #workspaces button {
      color: darker(@secondary);
    }

    #workspaces button.active {
      color: @secondary;
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
	      margin = "90 0 90 15";
        spacing = 5;

        modules-center = ["niri/workspaces" "clock#time" "clock#date" "group/others"];

	      "niri/workspaces" = {
          "format" = "0{}";
          "persistent-workspaces" = {
            "*" = 3;
          };
	      };

        "niri/language" = {
          "format" = "{}";
          "format-en" = "en";
        };

        "keyboard-state" = {
          "numlock" = false;
          "capslock" = true;
          "format" = "{icon}";
          "format-icons" = {
            "locked" = " ";
            "unlocked" = " ";
          };
        };

	      "clock" = {
          format = "{:%I\n%M}";
	        tooltip = false;
	      };

        "clock#date" = {
          interval = 60;
          format = "{:%m\n%d}";
        };

        "clock#time" = {
          interval = 60;
          format = "{:%H\n%M}";
        };


        network = {
	        format = "{icon}";
	        "format-disconnected" = "󰤯 ";
	        "format-icons" = [ "󰤨 " ];
	        tooltip = false;
	      };

        "bluetooth" = {
          "format" = "";
          "format-connected" = "󰂱 ";
          "format-disabled" = "󰂲 ";
          tooltip = false;
        };

	      backlight = {
          format = "{percent}";
	        tooltip = false;
	      };

	      pulseaudio = {
          format = "{volume}";
	        tooltip = false;
	      };

        battery = {
          format = "{}"; 
	        tooltip = false;
          interval = 2;
	      };

        "group/connections" = {
          orientation = "inherit";
          modules = ["network" "bluetooth"];
        };

        "group/others" = {
          orientation = "inherit";
          modules = ["backlight" "pulseaudio" "battery"];
        };
      };
    };
  };
}
