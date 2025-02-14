{ config, pkgs, lib, ... }: {
  programs.bash.enable = true;
  programs.bash.bashrcExtra = ''
   eval "$(starship init bash)"
  '';
  programs.bash.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ./";
    vim = "nvim";
    ls = "lsd";
  };
}
