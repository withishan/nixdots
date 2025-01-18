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

    colorschemes.tokyonight.enable = true;
    colorschemes.tokyonight.settings = {
      transparent = true;
    };

    plugins = {
      cursorline = {
        enable = true;
      };
      treesitter.enable = true;
      yazi.enable = true;
      lazygit.enable = true;
      bufferline.enable = true;
      nvim-colorizer.enable = true;
      presence-nvim.enable = true;
      web-devicons.enable = true;
      lualine.enable = true;    
      lualine.settings = {
        sections = {
          lualine_a = ["mode"];
          lualine_b = ["filename"];
          lualine_c = [""];
          lualine_x = ["diff"];
          lualine_y = ["diagnostics"];
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
