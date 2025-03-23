{ config, lib, ... }: {
  programs.rofi = {
    enable = true;
    font = "Archivo 18";
    theme = "~/nixdots/modules/imports/theme.rasi";
  };
}
