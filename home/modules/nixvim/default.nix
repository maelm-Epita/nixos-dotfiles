{config, lib, pkgs, ...}:
{
  # Dependencies that cannot be installed through extraPackages
  home.packages = [
    pkgs.python313
    pkgs.python313Packages.pylatexenc
  ];

  programs.nixvim = {
    enable = true;
    imports = [
      #./colorscheme.nix
      ./options.nix
      ./keymaps.nix
      #./plugins
    ];
  };
}
