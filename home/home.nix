{ config, pkgs, ... }:

{
  home.username = "mael";
  home.homeDirectory = "/home/mael";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  imports = [
    ./bundle.nix
  ];

  home.packages = with pkgs; [
    # neovim -- is installed through nixvim ; installing it from pkgs breaks the configuration
    blueman
    pavucontrol
    git
    foot
    firefox
    waybar
    xfce.thunar
    rofi
    fastfetch
    swaylock-effects
    btop
    anki
    grim
    slurp
    wl-clipboard
    vesktop
    fcitx5
    fcitx5-mozc
    cascadia-code
  ];

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
}
