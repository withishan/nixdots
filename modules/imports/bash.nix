{ config, pkgs, lib, ... }: {
  programs.bash.bashrcExtra = {
    ''eval "$(starship init bash)"''
  };
}
