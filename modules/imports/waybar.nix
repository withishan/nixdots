{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    style = "
    @import url('./colors.css');

    * {
      font-family: 'Martian Mono Nerd Font';
      font-weight: 400;
      font-size: 18px;
      border: none;
      border-radius: 0px;
      box-shadow: none;
      text-shadow: none;
      padding: 0px;
    }
    
    window#waybar {
      border-bottom: none;
      border: 0px solid alpha(@secondary_container, 0.5);
      border-radius: 0px;
      background: none;
      box-shadow: none;
    }

    #battery {
      color: @secondary;
    }

    #pulseaudio {
      color: @secondary;
    }

    #backlight {
      color: @secondary;
    }

    #workspaces {
      font-size: 16px;
      padding: 2px 0px 0px 0px;
      border: 2px solid alpha(@secondary_container, 0.5);
      border-radius: 0px;
      transition: none;
      background: @surface_container_low;
    }

    #datetime {
      color: @secondary;
      padding: 7px 16px;
      border-radius: 0px;
      transition: none;
      background: @surface_container_low;
      border: 2px solid alpha(@secondary_container, 0.5);
    }

    #connections {
      padding: 7px 16px;
      background: @surface_container_low;
      border: 2px solid alpha(@secondary_container, 0.5);
    }

    #bunch {
      padding: 7px 16px;
      border: 2px solid alpha(@secondary_container, 0.5);
      background: @surface_container_low;
    }

    #network {
      color: @secondary;
      padding: 0px 4px 0px 0px;
      transition: none;
    }

    #bluetooth {
      color: @secondary;
      transition: none;
    }

    #bluetooth.connected {
      color: @secondary;
      transition: none;
    }
    
    #workspaces button {
      color: darker(@secondary);
      padding: 2px 4px 2px 4px;
      margin-bottom: 2px;
      margin-left: 2px; 
      margin-right: 2px;
      border-radius: 0px;
      border: 2px solid alpha(@secondary_fixed_dim, 0);
      background: alpha(@secondary_fixed_dim, 0.1);

    }
    
    #workspaces button.active {
      color: @secondary;
      border: 2px solid alpha(@secondary_fixed_dim, 0.2);
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
	      margin = "70 0 70 5";
        spacing = 5;

	      modules-left = ["niri/workspaces" "group/datetime" "group/bunch" "group/connections"];

	      "niri/workspaces" = {
          "format" = "{icon}";
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
          };
          "persistent-workspaces" = {
            "*" = 3;
          };
	      };

	      "group/datetime" = {
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

        "group/connections" = {
          modules = ["network" "bluetooth"];
          orientation = "inherit";
        };
        
        "group/bunch" = {
          modules = ["pulseaudio" "backlight" "battery"];
          orientation = "inherit";
        };

        "bluetooth" = {
          "format" = "";
          "format-connected" = "󰂱";
          "format-disabled" = "󰂲 ";
          tooltip = false;
        };

	      backlight = {
          format = "{percent}";
	        tooltip = false;
	      };

	      battery = {
          format = "{}"; 
          tooltip = false;
          interval = 2;
	      };

	      pulseaudio = {
          format = "{volume}";
	        "format-muted" = "M";
	        tooltip = false;
	      };

	      network = {
	        format = "{icon}";
	        "format-disconnected" = "󰤯";
	        "format-icons" = [ "󰤨" ];
	        tooltip = false;
	      };
      };
    };
  };
}
