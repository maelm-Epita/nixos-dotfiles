{
    # I like both themes, moonfly is way higher contrast
    #programs.nixvim.colorschemes.moonfly.enable = true; 
    #programs.nixvim.colorscheme = "moonfly";

    programs.nixvim.colorschemes.kanagawa = {
        enable = true; 
        settings = {
            colors = {
                palette = {
                    samuraiRed = "#EB5A3C";
                };
                theme.wave = {
                    ui = {
                        bg_gutter = "none";
                        pmenu = {
                            bg = "none";
                        };
                    };

                };
            };
        };
    };
    programs.nixvim.colorscheme = "kanagawa";
}
