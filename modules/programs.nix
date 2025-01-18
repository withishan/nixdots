{ config, lib, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    libreoffice
    ghostty
    wl-clipboard
    firefox
    gh 
    pywal
    nitch
    unzip
    brightnessctl
    font-manager
    fzf
    git
    cava
    grim
    slurp
    waybar
    starship
    nautilus
    swww
    neovim
    vesktop 
    fuzzel 
  ];
}
