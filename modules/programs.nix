{ config, lib, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    inputs.matugen.packages.${system}.default
    ghostty
    wl-clipboard
    firefox
    pywalfox-native
    lsd
    stow
    cava
    spotify
    gh 
    nitch
    brightnessctl
    font-manager
    fzf
    git
    grim
    slurp
    waybar
    starship
    oh-my-posh
    nautilus
    swww
    neovim
    vesktop 
    rofi
    nwg-look
  ];
}
