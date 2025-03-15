{ config, pkgs, lib, ... }: {
  programs.wofi.enable = true;
  programs.wofi.settings = {
    mode = "drun";
    allow_images = true;
    image_size = 30;
    prompt = "Search";
    columns = 1;
    width = 480;
    height = 330;
    no_actions = true;
    location = "center";
    colors = "colors";
    filter_rate = 100;
    allow_markup = true;
    halign = "fill";
    orientation = "vertical";
    content_halign = "fill";
    matching = "contains";
    insensitive = true;
    term = "ghostty";
    parse_search = true;
    single_click = false;
    line_wrap = "char";
    key_down = "Tab";
    key_expand = "Right";
    key_forward = "Down";
  };

  programs.wofi.style = ''
    @import ".cache/wal/colors-waybar.css";

    *{
      border: none;
      box-shadow: none;
      outline: none;
    }
    
    window {
      font-size: 20px;
      font-family: "Host Grotesk";
      font-weight: 600;
      background-color: @background;
      border-radius: 8px;
      opacity: 0.98;
    }
    
    #outer-box {
      margin: 10px 10px 20px 10px;
      background-color: @background;
      opacity: 0.90;
    }
    
    #inner-box {
      margin: 10px;
      background-color: @background;
      opacity: 0.90;
    }
    
    #entry {
      padding: 5px 10px;
      border-radius: 20px;
    }
    
    #entry #text {
      padding: 0px 0px 0px 10px;
      font-weight: normal;
      color: lighter(@color3);
    }
    
    #entry:selected {
      background-color: darker(@color3);
    }
    
    #entry:selected #text {
      padding: 0px 0px 0px 10px;
      font-weight: normal;
      color: lighter(@color0);
    }
    
    #input {
      background: transparent;
      margin: 0px 5px 0px 20px;
      color: lighter(@color3);
      padding: 10px;
    }
    
    #image {
      margin-left: 20px;
      margin-right: 20px;
    }
    
    #scroll {
      margin: 0px;
    }
  '';
}
