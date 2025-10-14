{pkgs, lib, ...}: {
  # Dependencies that cannot be installed through extraPackages
  home.packages = with pkgs [
    python313
    python313Packages.pylatexenc
  ];
  programs.nixvim = import ./nixvim;
}
