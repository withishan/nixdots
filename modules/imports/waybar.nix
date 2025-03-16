{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    style = "
    @import url('./colors.css');

    * {
      color: @secondary;
      font-family: 'Host Grotesk';
      font-weight: 600;
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
      border: 2px solid alpha(@secondary_container, 0.7);
      border-radius: 10px;
      background: alpha(@surface, 0.7);
    }

    #audio {
      margin: 0px 8px;
      padding-left: 2px;
      padding-right: 2px;
      border-radius: 8px;
      background: alpha(@surface_bright, 0.7);
    }

    #battery {
      margin-top: 5px;
      margin-bottom: 10px;
    }

    #pulseaudio {
      font-size: 17px;
      margin-top: 5px;
      margin-bottom: 5px;
    }

    #custom-sdio,
    #custom-rtns
    {
      margin-top: 2px;
      margin-bottom: 2px;
      padding: 2px 0px;
      border-radius: 8px;
      background-color: alpha(@secondary_fixed_dim, 0.2);
    }

    #workspaces {
      margin: 0px 8px 0px 8px;
      padding: 2px 0px;
      border-radius: 8px;
      transition: none;
      background: alpha(lighter(@surface_bright), 0.5);
    }

    #keyboard-state {
      margin: 8px 8px 0px 8px;
      padding: 2px 0px 2px 4px;
      border-radius: 8px;
      transition: none;
      background: alpha(lighter(@surface_bright), 0.5);
    }

    #language {
      margin: 0px 8px 0px 8px;
      padding: 2px 0px;
      border-radius: 8px;
      transition: none;
      background: alpha(lighter(@surface_bright), 0.5);
    }

    #clock {
      margin: 0px 8px;
      padding: 4px 8px;
      border-radius: 8px;
      transition: none;
      background: alpha(@surface_bright, 0.7);
    }

    #battery {
      margin: 0px 8px 8px 8px;
      padding: 10px 4px;
      border-radius: 8px;
      transition: none;
      background: alpha(@surface_bright, 0.7);
    }

    #brightness {
      margin: 0px 8px;
      padding-left: 2px;
      padding-right: 2px;
      border-radius: 8px;
      transition: none;
      background: alpha(@surface_bright, 0.7);
    }

    #memory {
      margin: 0px 8px;
      padding: 6px 0px 6px 4px;
      border-radius: 8px;
      transition: none;
      background: alpha(@surface_bright, 0.7);
    }

    #network {
      margin: 0px 8px;
      padding: 6px 4px 6px 4px;
      border-radius: 8px;
      transition: none;
      background: alpha(@surface_bright, 0.7);
    }
    
    #custom-screen {
      margin: 0px 8px;
      padding: 6px 5px 6px 8px;
      border-radius: 8px;
      transition: none;
      background: alpha(@surface_bright, 0.7);
    }

    #backlight {
      font-size: 16px;
      margin-top: 5px;
      margin-bottom: 5px;
    }

    #workspaces button {
      padding: 2px 4px 2px 4px;
      margin-left: 2px; 
      margin-right: 2px;
      border-radius: 8px;
      background: none;
    }
    
    #workspaces button.active {
      color: @surface;
      background: alpha(@secondary_fixed_dim, 0.2);
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

	      modules-left = ["keyboard-state" "hyprland/language" "hyprland/workspaces"];
	      modules-right = ["clock" "network" "group/audio" "memory" "custom/screen" "group/brightness" "battery"];

	      "hyprland/workspaces" = {
          "format" = "{icon}";
          "format-icons" = {
             "1" = "一";
             "2" = "二";
             "3" = "三";
             "4" = "四";
             "5" = "五";
             "6" = "六";
             "7" = "七";
             "8" = "八";
             "9" = "九";
             "10" = "十";
          };
          "persistent-workspaces" = {
            "*" = 3;
          };
	      };

        "hyprland/language" = {
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

        "group/brightness" = {
          orientation = "inherit";
          modules = ["custom/rtns" "backlight"];
        };

        "custom/screen" = {
          format = " ";
          tooltip = false;
          on-click = ''grim -g "$(slurp -d)" - | wl-copy'';
        };

        "custom/rtns" = {
          "format" = "󰃞 ";
          tooltip = false;
        };

        "custom/sdio" = {
          "format" = " ";
          tooltip = false;
        };

        "memory" = {
          "interval" = 30;
          "format" = "{icon}";
          "format-icons" = ["󰝦 " "󰪞 " "󰪟 " "󰪠 " "󰪡 " "󰪢 " "󰪣 " "󰪤 " "󰪥 "];
        };

	      backlight = {
          format = "{percent}";
	        tooltip = false;
	      };

        "group/audio" = {
          "orientation" = "inherit";
          "modules" = ["custom/sdio" "pulseaudio"];
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
          format = "{volume}";
	        "format-muted" = "⨯";
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
