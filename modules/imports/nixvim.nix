{ self, pkgs, ... }: {
  programs.nixvim = {
    enable = true;

    vimAlias = true;

    globals = {
      mapleader = " ";
    };

    opts = {
      relativenumber = true;
      number = true;
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
    };

    colorschemes.everforest.enable = true;
    colorschemes.everforest.settings = {
      transparent_background = 1;
    };

    plugins = {
      treesitter.enable = true;
      nvim-tree.enable = true;
      bufferline.enable = true;
      nvim-colorizer.enable = true;
      presence-nvim.enable = true;
    };
  };
}
