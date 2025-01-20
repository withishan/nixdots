{ config, lib, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    ghostty
    wl-clipboard
    firefox
    gh 
    kooha
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
