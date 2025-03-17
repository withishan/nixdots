{ config, pkgs, lib, ... }: {
  programs.tofi.enable = true;
  programs.tofi.settings = {
    drun-launch = true;
    font = "Iosevka Nerd Font";
    font-size = 21;
    corner-radius = 5;
    outline-width = 10;
    outline-color = "#000000";
    border-width = 0;
    background-color = "#000000";
    text-color = "#ffffff";
    prompt-text = "❯";
    prompt-padding = 10;
    width = 380;
    height = 480;
  };
}
