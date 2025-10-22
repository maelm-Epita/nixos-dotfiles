{
  programs.ripgrep.enable = true;
    
  programs.nixvim.plugins.web-devicons = {
    enable = true;
  };
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions = {
        fzf-native.enable = true;
        ui-select.enable = true;
    };
    keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
    };
  };
}
