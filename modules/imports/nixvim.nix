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
        name = "evergarden";
        src = pkgs.fetchFromGitHub {
          owner = "comfysage";
          repo = "evergarden";
          rev = "1f491009c634277a971d1c682a24cb7ceaef7eb0";
          sha256 = "1z24qxgfn5xysr29qhy9cqm28jc1hx8w7815anc15b2z06374m7d";
        };
      })
    ];

    # colorscheme = "rose-pine";
    # extraConfigLua = ''
    #   require("evergarden").setup({
    #       transparent_background = true,
    #       variant = "soft",
    #   })
    #   vim.cmd "colorscheme evergarden"
    # '';

    colorschemes.rose-pine.enable = true;
      colorschemes.rose-pine.settings = {
        styles = {
          italic = false;
          transparency = true;
        };
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
      nvim-tree.enable = true;
      neocord.enable = true;
      neocord.settings = {
        global_timer = true;
      };
      web-devicons.enable = true;
    };
  };
}
