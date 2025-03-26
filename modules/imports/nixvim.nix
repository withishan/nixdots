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
        name = "lackluster.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "slugbyte";
          repo = "lackluster.nvim";
          rev = "662fba7e6719b7afc155076385c00d79290bc347";
          sha256 = "1jp02km6hmryb9g36z239qkv34hmjx0hbwmg2ns1aq7cqzy1m5x1";
        };
        # dependencies = [ lush-nvim ];
      })
    ];

    extraConfigLua = ''
      require("lackluster").setup({
        tweak_background = {
          normal = 'none',    
          telescope = 'default', 
          menu = 'default',     
          popup = 'default',     
        },
      })
      vim.cmd.colorscheme("lackluster")
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
        enable = true;
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
