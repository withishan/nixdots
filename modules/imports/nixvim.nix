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

    extraPlugins = with pkgs.vimPlugins; [
      (pkgs.vimUtils.buildVimPlugin {
        name = "pywal16.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "uZer";
          repo = "pywal16.nvim";
          rev = "446ae689c8e4569b9537cddadb28d6e939658ea5";
          sha256 = "1y3r04n8ks1qq5rfv2lkxdsd39hajfiqg7z997m5j8xxq7cjzrlh";
        };
      })

      (pkgs.vimUtils.buildVimPlugin {
        name = "vague.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "vague2k";
          repo = "vague.nvim";
          rev = "aa744dbf7bfc768da3dd232ccde3b337182903dc";
          sha256 = "0vpyyak3fn3clnlnbmpj7a2bwdrbd14cz76xicvmrvfz1p1yfh7q";
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
      })
    ];

    colorscheme = "rosebones";
    extraConfigLua = ''
    '';

    # colorschemes.poimandres.enable = true;
    # colorschemes.poimandres.settings = {
    #   disable_background = true;
    # };
    # colorschemes.tokyonight.settings = {
    #   styles = {
    #     comments = {
    #       italic = false;
    #     };
    #     keywords = {
    #       italic = false;
    #     };
    #     # sidebars = "dark";
    #   };
    #   transparent = true;
    # };

    plugins = {
      cursorline = {
        enable = true;
        cursorline.timeout = 600;
      };
      treesitter.enable = true;
      lazygit.enable = true;
      bufferline.enable = true;
      nvim-colorizer.enable = true;
      neocord.enable = true;
      neocord.settings = {
        global_timer = true;
      };
      web-devicons.enable = true;
    };
  };
}
