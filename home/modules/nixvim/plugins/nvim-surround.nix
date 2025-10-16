{
    programs.nixvim.plugins.nvim-surround = {
        enable = true;
        settings = {
            keymaps = {
                normal = "ya";
                normal_line = "yA";
                delete = "da";
            };
        };
    };
}
