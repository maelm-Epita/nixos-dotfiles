{
  programs.nixvim.keymaps = [
    {
        mode = "n";
        key = "s";
        action.__raw = ''function() require("flash").jump() end'';
    }
  ];
  programs.nixvim.plugins.flash = {
    enable = true;
 };
}
