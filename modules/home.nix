{ config, pkgs, inputs, ... }: {
  imports = [
    ./imports/niri.nix
    ./imports/waybar.nix
    ./imports/fuzzel.nix
    ./imports/bash.nix
    ./imports/nixvim.nix
  ]; 

  home = {
    username = "ishan";
    homeDirectory = "/home/ishan"; 
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}

