{ config, lib, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    inputs.ghostty.packages.${pkgs.system}.default
    wl-clipboard
    gh 
    unzip
    lsd
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
