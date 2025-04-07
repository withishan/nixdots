{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.textfox.homeManagerModules.default
    ./imports/textfox.nix
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

  textfox = {
    enable = true;
    profile = "default";
    config = {
    };
  };

  programs.home-manager.enable = true;
}
