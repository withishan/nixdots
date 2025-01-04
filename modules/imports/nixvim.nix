{ self, ... }: {
  programs.nixvim = {
    enable = true;
    colorschemes.kanagawa.enable = true;
    plugins = {
      lualine.enable = true;
    };
  };
}
