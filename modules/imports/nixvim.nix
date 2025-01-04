{ self, ... }: {
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
      shiftwidth = 2;
      tabstop = 2;
    };

    colorschemes.kanagawa.enable = true;

    plugins = {
      lualine.enable = true;
    };
  };
}
