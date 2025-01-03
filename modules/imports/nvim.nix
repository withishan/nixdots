{ config, pkgs, lib, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      lualine-nvim
      catppuccin-nvim
    ];
  };
}
