{
    programs.nixvim.plugins.nvim-surround = {
        enable = true;
        settings = {
            keymaps = {
                insert = "<C-g>s";
                insert_line = "<C-g>S";
                normal = "ya";
                normal_line = "yA";
            };
        };
    };
}
