{ config, lib, pkgs, ...}: {
  /*
  # Render-Markdown config, replaced by markview because latex formatting is kind of bad and uses an extra python module

  # Dependencies that cannot be installed through extraPackages
  home.packages = [
    pkgs.python313
    pkgs.python313Packages.pylatexenc
  ];
  # Nixvim dependencies
  programs.nixvim.withPython3 = true;
  programs.nixvim.extraPython3Packages = p: [ p.pylatexenc ];

  programs.nixvim.plugins.render-markdown = {
    enable = true;
  };
  */

  programs.nixvim.plugins.markview = {
    enable = true;
  };
  programs.nixvim.plugins.markdown-preview =
  {
    enable = true;
  };
}
