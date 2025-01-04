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
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
    };

    colorschemes.kanagawa.enable = true;

    plugins = {
      treesitter.enable = true;
    };
  };
}
