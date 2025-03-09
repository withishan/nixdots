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
    ];

    # colorscheme = "pywal16";
    # extraConfigLua = ''
    # require("vague").setup({
    #   transparent = true,
    #   style = {
    #     boolean = "bold",
    #     number = "none",
    #     float = "none",
    #     error = "bold",
    #     comments = "none",
    #     conditionals = "none",
    #     functions = "none",
    #     headings = "bold",
    #     operators = "none",
    #     strings = "none",
    #     variables = "none",

    #     keywords = "none",
    #     keyword_return = "none",
    #     keywords_loop = "none",
    #     keywords_label = "none",
    #     keywords_exception = "none",

    #     builtin_constants = "bold",
    #     builtin_functions = "none",
    #     builtin_types = "bold",
    #     builtin_variables = "none",
    #     },
    #   })
    #    vim.cmd "colorscheme vague"
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
