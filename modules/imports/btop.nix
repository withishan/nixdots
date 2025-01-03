{ config, pkgs, lib, ... }: {
  programs.btop.enable = true;
  programs.btop.settings = {
    color_theme = "tokyo-storm";
  };
}
