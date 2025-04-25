{ config, pkgs, inputs, ... }: {
  imports = [
    ./imports/waybar.nix
    ./imports/bash.nix
    ./imports/nixvim.nix
    ./imports/hypr.nix
    ./imports/niri.nix
  ]; 

  home = {
    username = "ishan";
    homeDirectory = "/home/ishan"; 
    stateVersion = "24.11";
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.apple-cursor;
    name = "apple-cursor";
    size = 24;
  };

  programs.home-manager.enable = true;
}
