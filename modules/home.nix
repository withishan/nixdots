{ config, pkgs, inputs, ... }: {
  imports = [
    ./imports/niri.nix
    ./imports/waybar.nix
    ./imports/fuzzel.nix
    ./imports/bash.nix
    ./imports/nixvim.nix
    ./imports/hypr.nix
  ]; 

  home = {
    username = "ishan";
    homeDirectory = "/home/ishan"; 
    stateVersion = "24.11";
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.banana-cursor;
    name = "banana-cursor";
    size = 24;
  };

  programs.home-manager.enable = true;
}
