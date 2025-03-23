{ config, lib, ... }: {
  programs.rofi = {
    enable = true;
    font = "Archivo 18";
    configPath = "./config.rasi";
  };
}
