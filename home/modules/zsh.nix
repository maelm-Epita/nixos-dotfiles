{config, pkgs, lib, ...}: 
let
  session = config.home.sessionVariables;
in
{
  programs.zsh = {
    enable = true;
    shellAliases = {
	ls="ls -A --color=auto";
	neofetch="fastfetch";
	ccdb="gcc -fsanitize=address -g -std=c99 -pedantic -Werror -Wall -Wextra -Wvla";
	home-rb="home-manager switch --flake ${session.FLAKEDIR}";
	nixos-rb="sudo nixos-rebuild switch --flake ${session.FLAKEDIR}";
    };
  };
}
