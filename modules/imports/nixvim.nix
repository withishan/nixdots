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
        name = "lush.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "rktjmp";
          repo = "lush.nvim";
          rev = "45a79ec4acb5af783a6a29673a999ce37f00497e";
          sha256 = "0ac93sdhsi41hpwpshffpkvj5c3kklflsy0pln77743x69g05rcr";
        };
      })
      
      (pkgs.vimUtils.buildVimPlugin {
        name = "zenbones.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "zenbones-theme";
          repo = "zenbones.nvim";
          rev = "dbd485fa5d5230d175e024374d41dab5ad71b119";
          sha256 = "102375anp0b4iygnxcrx173r5cll3x1gwhfm4qnl3xq26691xy9p";
        };
        dependencies = [ lush-nvim ];
      })
    ];

    extraConfigLua = ''
      vim.o.termguicolors = true
      vim.o.background = "dark"
      vim.cmd("colorscheme rosebones")
      vim.cmd([[
        hi Normal guibg=NONE ctermbg=NONE
        hi NormalNC guibg=NONE ctermbg=NONE
        hi EndOfBuffer guibg=NONE ctermbg=NONE
        hi SignColumn guibg=NONE ctermbg=NONE
      ]])
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
      bufferline.enable = true;
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
