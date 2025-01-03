{ config, pkgs, lib, ... }: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lualine-nvim
    ];
    extraLuaConfig = ''
    '';
  };
}
