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
        action = "<cmd>NvimTreeToggle<cr>";
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
        name = "pywal16.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "uZer";
          repo = "pywal16.nvim";
          rev = "446ae689c8e4569b9537cddadb28d6e939658ea5";
          sha256 = "1y3r04n8ks1qq5rfv2lkxdsd39hajfiqg7z997m5j8xxq7cjzrlh";
        };
      })
    ];

    # colorscheme = "pywal16";
    # extraConfigLua = ''
    #   vim.cmd "colorscheme twilight-moon"
    # '';

    colorschemes.rose-pine.enable = true;
    colorschemes.rose-pine.settings = {
      styles = {
        bold = false;
        italic = true;
        transparency = true;
      };
    };

    plugins = {
      lualine = {
        enable = true;
        settings = {
          options = {
            component_separators = "";
            section_separators = {
              left = "";
              right = "";
            };
            globalstatus = true;
          };
          sections = {
            lualine_a = [
              {
                __unkeyed-1 = "mode";
                separator = {
                  left = " ";
                  right = "";
                };
              }
            ];
            lualine_b = [
              {
                __unkeyed-1 = "filetype";
                icon_only = true;
                padding = {
                  right = 0;
                  left = 1;
                };
              }
              "filename"
            ];
            lualine_c = [
              {
                __unkeyed-1 = "branch";
                icon = " ";
              }
            ];
            lualine_x = [
              {
                __unkeyed-1 = "diagnostics";
                symbols = {
                  error = " ";
                  warn = " ";
                  info = " ";
                  hint = " ";
                };
                update_in_insert = true;
              }
            ];
            lualine_z = [
              {
                __unkeyed-1 = "location";
                separator = {
                  left = "";
                  right = " ";
                };
              }
            ];
          };  
          inactive_sections = {
				    lualine_a = [ "filename" ];
				    lualine_b = [];
				    lualine_c = [];
				    lualine_x = [];
				    lualine_y = [];
				    lualine_z = [ "location" ];
			    };
        };
      };
      cursorline = {
        enable = true;
        cursorline.timeout = 600;
      };
      treesitter.enable = true;
      lazygit.enable = true;
      bufferline.enable = true;
      nvim-colorizer.enable = true;
      nvim-tree = {
        enable = true;
        hijackNetrw = true;
        openOnSetup = true;
        openOnSetupFile = true;
        view = {
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
