{
  programs.nixvim.plugins.web-devicons = {
    enable = true;
  };
  programs.nixvim.plugins.neo-tree = {
    enable = true;
  };

  programs.nixvim.keymaps = [
    {
        mode = "n";
        key = "<C-n>";
        action = "<cmd>Neotree filesystem toggle right<CR>";
    }
  ];
}
