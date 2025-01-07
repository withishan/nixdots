{ config, lib, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    ghostty
    wl-clipboard
    firefox
    gh 
    unzip
    lsd
    cava
    brightnessctl
    font-manager
    stow
    fzf
    btop
    git
    grim
    slurp
    waybar
    nerdfetch
    starship
    swww
    neovim
    obsidian
    vesktop 
    fuzzel 
  ];
}
