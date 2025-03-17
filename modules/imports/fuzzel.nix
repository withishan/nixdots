{ config, pkgs, lib, ... }: {
  programs.fuzzel.enable = true;
  programs.fuzzel.settings = {
    main = {
      include = "/home/ishan/.config/fuzzel/colors.ini";
      font = "Archivo:size=13";
      prompt = ''"   "'';
      icons-enabled = "no";
      width = "13";
      vertical-pad = "25";
      horizontal-pad = "38";
      inner-pad = "10";
      line-height = "15";
    };

    border = {
     width = "0";
     radius = "10";
    };
  };
}
