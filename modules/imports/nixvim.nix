{ self, pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    vimAlias = true;
    globals = {
      mapleader = " ";
    };

    keymaps = [
      {
        action = "<cmd>LazyGit<cr>";
        key = "<C-l>";
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

    colorschemes.nord.enable = true;
    colorschemes.nord.settings = {
      disable_background = true;
      italic = false;
    };

    plugins = {
      cursorline = {
        enable = true;
        cursorline.timeout = 600;
      };
      treesitter.enable = true;
      lazygit.enable = true;
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
          lualine_x = ["filename"];
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
