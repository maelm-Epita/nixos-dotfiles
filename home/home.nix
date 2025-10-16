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
    # -- DE -- #
    blueman
    pavucontrol
    foot
    waybar
    xfce.thunar
    rofi
    swaylock-effects
    wl-clipboard
    # -- TERMINAL TOOLS -- #
    git
    btop
    pamixer
    brightnessctl
    # -- APPS -- #
    firefox
    vesktop
    anki
    # -- RICING -- #
    fastfetch
    # -- FONTS -- #
    cascadia-code
    noto-fonts-cjk-sans
  ];

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
}
