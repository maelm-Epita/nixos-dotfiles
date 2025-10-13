{ config, pkgs, ... }:

{
  home.username = "mael";
  home.homeDirectory = "/home/mael";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  imports = [
    ./bundle.nix
  ];

  home.packages = with pkgs; [
    neovim
    git
    foot
    firefox
    fastfetch
    btop
    anki
    vesktop
    fcitx5
    fcitx5-mozc
    cascadia-code
  ];

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
}
