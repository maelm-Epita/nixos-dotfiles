{pkgs, lib, ...}: {
  home.sessionVariables = {
    FLAKEDIR = "$(pwd)";
    TERMINAL = "foot";
    LAUNCHER = "rofi -show drun -location 2 --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto";
    FILEMANAGER = "thunar";
    SCREENSHOT = "grim -g $(slurp -d) - | wl-copy";
    OCR = "a";
    LOCK = "swaylock --screenshots --ignore-empty-password --daemonize --indicator-caps-lock --indicator --clock --show-failed-attempts --indicator-idle-visible";
  };
}
