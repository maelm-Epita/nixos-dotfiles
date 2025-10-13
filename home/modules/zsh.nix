{pkgs, lib, ...}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
	ls="ls -A --color=auto";
	neofetch="fastfetch";
	ccdb="gcc -fsanitize=address -g -std=c99 -pedantic -Werror -Wall -Wextra -Wvla";
	home-rb="home-manager switch --flake ${
    };
  }
}
