{ config, pkgs, lib, ... }: {
  programs.bash.enable = true;
  programs.bash.bashrcExtra = ''
   eval "$(oh-my-posh init bash --config ~/nixdots/modules/imports/json.omp.json)"
  '';
  programs.bash.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ./";
    vim = "nvim";
    ls = "lsd";
  };
}
