{ config, lib, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    ghostty
    imagemagick
    wl-clipboard
    gnome-tweaks
    firefox
    lsd
    gh 
    pywal16
    nitch
    brightnessctl
    font-manager
    fzf
    git
    grim
    slurp
    waybar
    starship
    nautilus
    swww
    neovim
    vesktop 
    fuzzel 
    nwg-look
  ];
}
