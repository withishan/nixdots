{ config, pkgs, lib, ... }: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lualine-nvim
    ];
    extraLuaConfig = ''
      ${builtins.readFile ./nvim/plugins/lualine.lua}
    '';
  };
}
