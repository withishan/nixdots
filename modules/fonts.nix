{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.departure-mono
    nerd-fonts.zed-mono
    nerd-fonts.martian-mono
  ]; 
}
