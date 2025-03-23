{ config, lib, ... }: {
  programs.rofi = {
    enable = true;
    theme = "~/nixdots/modules/imports/theme.rasi";
  };
}
