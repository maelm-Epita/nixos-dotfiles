{
    programs.nixvim.cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
            sources = [
                { name = "nvim_lsp"; }
                { name = "path"; }
                { name = "buffer"; }
            ];
            mapping = {
                "<C-n>" = "cmp.mapping.complete()";
                "<C-e>" = "cmp.mapping.close()";
                "<C-j>" = "cmp.mapping.scroll_docs(-4)";
                "<C-k>" = "cmp.mapping.scroll_docs(4)";
            };
            window = {
                completion = "cmp.config.window.bordered()";
                documentation = "cmp.config.window.bordered()";
            };
        };
    };
}
