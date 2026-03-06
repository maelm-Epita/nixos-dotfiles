{pkgs, ...}: {
    home.packages = with pkgs; [
    ];
    programs.nixvim.lsp = {
        servers = {
            clangd.enable = true;
            lua_ls.enable = true;
            pylsp.enable = true; # seems to not work
            pyright.enable = true;
            bashls.enable = true;
            rust_analyzer.enable = true;
            nixd.enable = true;
            asm-lsp.enable = true; # does not work 
            jdtls.enable = true;
            ts_ls.enable = true;
        };
    };
}
