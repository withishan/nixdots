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
        name = "sakura.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "anAcc22";
          repo = "sakura.nvim";
          rev = "1a7381e99b0253e34bf9cf4f283204b4948f5269";
          sha256 = "19kzdnxkyskgvxf4yvrxwmz861vvsd6ai8xwmlf1pm8ssk88j2qx";
        };
      })
    ];

    # colorscheme = "pywal16";

    colorschemes.rose-pine.enable = true;
    colorschemes.rose-pine.settings = {
      styles = {
        bold = false;
        italic = true;
        transparency = true;
      };
    };

    extraConfigLua = ''
      local mode_map = {
        ['NORMAL'] = 'NOR',
        ['O-PENDING'] = 'NOR?',
        ['INSERT'] = 'INS',
        ['VISUAL'] = 'VIS',
        ['V-BLOCK'] = 'VB',
        ['V-LINE'] = 'VL',
        ['V-REPLACE'] = 'VR',
        ['REPLACE'] = 'REP',
        ['COMMAND'] = 'CMD',
        ['SHELL'] = 'SH',
        ['TERMINAL'] = 'TER',
        ['EX'] = 'EX',
        ['S-BLOCK'] = 'SB',
        ['S-LINE'] = 'SL',
        ['SELECT'] = 'S',
        ['CONFIRM'] = 'Y?',
        ['MORE'] = 'M',
      }
      require("lualine").setup({
          inactive_sections = { 
            lualine_a = { "filename" }, 
            lualine_z = { "location" } 
          },
          options = { 
            component_separators = "", 
            globalstatus = true, 
            section_separators = { 
              left = "", 
              right = "" 
            }, 
          },
          sections = {
            lualine_a = { 
              { 
                "mode", 
                fmt = function(s) return mode_map[s] or s end, 
                separator = { 
                  left = " ", 
                  right = "" 
                } 
              } 
            },
            lualine_b = { 
              { 
                "branch", 
                icon = "" 
              },
            },
            lualine_c = {},
            lualine_x = {
            {
					      "diff",
					      symbols = { added = " ", modified = " ", removed = " " },
					      colored = false,
					    },
            },
            lualine_y = {
                {
                  "diagnostics",
                  symbols = { error = " ", hint = " ", info = " ", warn = " " },
                  update_in_insert = true,
                },
            },
            lualine_z = {
              {
                function()
                  return os.date("%-I:%-M %p")
                end,
                separator = { left = "", right = " " },
              }
            },
          },
      })
    '';

    plugins = {
      lualine = {
        enable = true;
      };
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
