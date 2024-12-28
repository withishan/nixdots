{ config, lib, pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    inputs.ghostty.packages.${pkgs.system}.default
    firefox
    wl-clipboard
    gh 
    brightnessctl
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
