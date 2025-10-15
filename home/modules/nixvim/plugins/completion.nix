{
    programs.nixvim.plugins.cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
            sources = [
                { name = "nvim_lsp"; }
                { name = "path"; }
                { name = "buffer"; }
            ];
            mapping = {
                "<C-Space>" = "cmp.mapping.complete()";
                "<C-e>" = "cmp.mapping.abort()";
                "<C-j>" = "cmp.mapping.select_next_item {behavior = cmp.SelectBehavior.Insert}";
                "<C-k>" = "cmp.mapping.select_prev_item {behavior = cmp.SelectBehavior.Insert}";
                "<C-n>" = "cmp.mapping.confirm({select = true})";
            };
            window = {
                completion.border = "rounded";
                documentation.border = "rounded";
            };
        };
    };
}
