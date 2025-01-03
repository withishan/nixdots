{ config, pkgs, lib, ... }: {
  programs.bash.enable = true;
  programs.bash.bashrcExtra = ''
   eval "$(starship init bash)"
  '';
  programs.bash.shellAliases = {
    ls = "lsd";
    rebuild = "sudo nixos-rebuild switch --flake ./";
  };
}
