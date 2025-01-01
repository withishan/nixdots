{ config, pkgs, lib, ... }: {
  programs.fuzzel.enable = true;
  programs.fuzzel.settings = {
    main = {
      font = "JetBrainsMono Nerd Font Mono:size=12";
      prompt = ''""'';
      icons-enabled = "no";
      width = "25";
      vertical-pad = "25";
      horizontal-pad = "35";
      inner-pad = "10";
    };

    colors = {
      background = "383c4aff";
      text = "99a0c6ff";
      input = "ffffffff";
      match = "ffffffff";
      selection = "383c4aff";
      selection-text = "ffffffff";
      selection-match = "ffffffff";
    };

    border = {
     width = "0";
     radius = "6";
    };
  };
}
