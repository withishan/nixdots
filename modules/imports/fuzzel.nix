{ config, pkgs, lib, ... }: {
  programs.fuzzel.enable = true;
  programs.fuzzel.settings = {
    main = {
      font = "Archivo:size=13";
      prompt = ''"   "'';
      icons-enabled = "no";
      width = "13";
      vertical-pad = "25";
      horizontal-pad = "35";
      inner-pad = "10";
    };

    colors = {
      prompt = "ffffffff";
      background = "343a40ff";
      text = "6c757dff";
      input = "ffffffff";
      match = "ffffffff";
      selection = "343a40ff";
      selection-text = "ffffffff";
      selection-match = "ffffffff";
    };

    border = {
     width = "0";
     radius = "6";
    };
  };
}
