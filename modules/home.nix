{ config, pkgs, inputs, ... }: {
  imports = [
    ./configs/niri.nix
    ./configs/waybar.nix
    ./configs/fuzzel.nix
    ./configs/btop.nix
    ./configs/bash.nix
    ./configs/neovim.nix
  ]; 

  home = {
    username = "ishan";
    homeDirectory = "/home/ishan"; 
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}

