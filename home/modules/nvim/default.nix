{pkgs, lib, ...}: {
  # Dependencies that cannot be installedd through extraPackages
  programs.python = {
    enable = true;
    package = pkgs.python313;
    pipPackages = [
      pkgs.python313.pylatexenc
    ];
  };
  programs.nixvim = import ./nixvim;
}
