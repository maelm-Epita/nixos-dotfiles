{
    programs.nixvim.diagnostic.settings = {
        virtual_text = true;
        signs = true;
        underline = true;
        update_in_insert = false;
        severity_sort = true;
        float = {
            border = "rounded";
        };
    };
}
