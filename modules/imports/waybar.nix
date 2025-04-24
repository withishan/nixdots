{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    style = "
    @import url('./colors.css');

    * {
      font-family: 'MartianMono Nerd Font';
      font-weight: 400;
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

    #bunch {
      font-size: 18px;
      min-width: 24px;
      color: @secondary;
      padding: 10px 16px;
      border: 2px solid alpha(@secondary_container, 0.5);
      border-radius: 0px;
      transition: none;
      background: @surface_container_low;
    }

    #network {
      padding: 0px 4px 0px 0px;
    }

    #connections {
      font-size: 18px;
      color: @secondary;
      padding: 10px 16px;
      border: 2px solid alpha(@secondary_container, 0.5);
      border-radius: 0px;
      transition: none;
      background: @surface_container_low;
    }

    #others {
      font-size: 18px;
      color: @secondary;
      padding: 10px 6px;
      border: 2px solid alpha(@secondary_container, 0.5);
      border-radius: 0px;
      transition: none;
      background: @surface_container_low;
    }

    #workspaces {
      font-size: 18px;
      padding: 10px 16px;
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
      background: alpha(darker(@secondary), 0.4);
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
	      margin = "70 5 70 15";
        spacing = 5;

        modules-left = ["niri/workspaces" "group/bunch" "group/connections" "group/others"];

	      "niri/workspaces" = {
          "format" = "{}";
          "format-icons" = {
            "1" = "01";
            "2" = "02";
            "3" = "03";
            "4" = "04";
            "5" = "05";
            "6" = "06";
            "7" = "07";
            "8" = "08";
            "9" = "09";
            "10" = "10";
          };
	      };

        "niri/language" = {
          "format" = "{}";
          "format-en" = "EN";
        };

        "group/bunch" = {
          orientation = "inherit";
          modules = ["clock#date" "custom/separator" "clock#time"];
        };

        "clock#date" = {
          interval = 60;
          format = "{:%m\n%d}";
        };

        "custom/separator" = {
          rotate = 270;
          "format" = "|";
        };

        "clock#time" = {
          interval = 60;
          format = "{:%H\n%M}";
        };


        network = {
	        format = "{icon}";
	        "format-disconnected" = "󰤯";
	        "format-icons" = [ "󰤟" "󰤢" "󰤥" "󰤨" ];
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

        tray = {
          "icon-size" = 20;
          spacing = 5;
        };

        "group/connections" = {
          orientation = "inherit";
          modules = ["network" "bluetooth" "tray"];
        };

        "group/others" = {
          orientation = "inherit";
          modules = ["backlight" "pulseaudio" "battery"];
        };
      };
    };
  };
}
