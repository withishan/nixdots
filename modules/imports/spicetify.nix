{ pkgs, lin, spicetify-nix, ... }: {
  let
    spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
  in
  {
    programs.spicetify = {
      enable = true;
      theme = spicePkgs.themes.text;

      enablesExtensions = with spicePkgs.extensions; [
      ];
    };
  }
}
