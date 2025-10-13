{pkgs, lib, ...}: {
  programs.rofi = {
    enable = true;
    theme = "dmenu";
    modes = [ "drun" ];
    font = "mono 12";
    xoffset = 5;
    extraConfig = {
      show-icons = true;
    };
  }
}
