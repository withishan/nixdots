{ self, pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    vimAlias = true;
    globals = {
      mapleader = " ";
    };

    keymaps = [
      {
        action = "<cmd>Yazi<cr>";
        key = "<C-y>";
      }
    ];

    opts = {
      relativenumber = true;
      number = true;
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
    };

    colorschemes.poimandres.enable = true;
    colorschemes.poimandres.settings = {
      disable_background = true;
    };

    plugins = {
      cursorline = {
        enable = true;
      };
      treesitter.enable = true;
      yazi.enable = true;
      bufferline.enable = true;
      nvim-colorizer.enable = true;
      presence-nvim.enable = true;
      web-devicons.enable = true;
      lualine.enable = true;    
      lualine.settings = {
        sections = {
          lualine_a = ["mode"];
          lualine_b = [""];
          lualine_c = [""];
          lualine_x = [""];
          lualine_y = ["diff"];
        };

        options = {
          globalstatus = true;

          section_separators = {
            left = "";
            right = "";
          };

          component_separators = {
            left = "";
            right = "";
          };
        };
      };
    };
  };
}
