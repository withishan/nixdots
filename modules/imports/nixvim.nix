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
      {
        action = "<cmd>Neotree<cr>";
        key = "<C-n>";
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

    extraPlugins = with pkgs.vimPlugins; [
      (pkgs.vimUtils.buildVimPlugin {
        name = "vague.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "vague2k";
          repo = "vague.nvim";
          rev = "982453f671332ce0240a15be5eb223d32f877e06";
          sha256 = "1b83xhppl2mgk9ycvg8aywksf13z2l7l3hijdw9v46p7ycqcvla0";
        };
        # dependencies = [ lush-nvim ];
      })
    ];

    extraConfigLua = ''
      require("vague").setup({
        transparent = true,
        style = {
          boolean = "none",
          comments = "italic",
          strings = "none",
          keyword_return = "none",
        },
      })
      vim.cmd.colorscheme("vague")
    '';

    # colorschemes.rose-pine.enable = true;
    # colorschemes.rose-pine.settings = {
    #   styles = {
    #     bold = false;
    #     italic = true;
    #     transparency = true;
    #   };
    # };

    plugins = {
      lualine.enable = false;
      cursorline = {
        enable = true;
        cursorline.timeout = 600;
      };
      treesitter.enable = true;
      lazygit.enable = true;
      bufferline = {
        enable = false;
        settings = {
          options = {
            show_buffer_icons = false;
          };
        };
      };
      nvim-colorizer.enable = true;
      neo-tree = {
        enable = true;
        filesystem = {
          hijackNetrwBehavior = "open_current";
        };      
        window = {
          width = 24;
        };
      };
      neocord.enable = true;
      neocord.settings = {
        global_timer = true;
      };
      web-devicons.enable = true;
    };
  };
}
