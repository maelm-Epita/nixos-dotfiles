{pkgs, lib, ...}: {
  programs.rofi = {
    enable = true;
    theme = "dmenu";
    modes = [ "drun" ];
    font = "mono 15";
    xoffset = 5;
    yoffset = -10;
    location = "top";
    extraConfig = {
      show-icons = true;
    };
  };
}
