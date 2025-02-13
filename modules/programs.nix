{ config, lib, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    ghostty
    wl-clipboard
    gnome-tweaks
    firefox
    gh 
    pywal
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
