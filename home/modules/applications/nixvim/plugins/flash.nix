{
  programs.nixvim.keymaps = [
    {
        mode = [ "n" "x" "o" ];
        key = "s";
        action.__raw = ''function() require("flash").jump() end'';
    }
  ];
  programs.nixvim.plugins.flash = {
    enable = true;
 };
}
