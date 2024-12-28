{ config, pkgs, lib, ... }: {
  programs.bash.enable = true;
  programs.bash.bashrcExtra = ''
   eval "$(starship init bash)"
  '';
}
