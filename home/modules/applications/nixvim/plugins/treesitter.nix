{pkgs, ...}: {
    programs.nixvim.plugins.treesitter = {
        enable = true;
        grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
        settings = {
            ensure_installed = [];
            autoInstall = false;
            indent.enable = true;
            highlight.enable = true;
        };
        nixvimInjections = true;
    };
}
