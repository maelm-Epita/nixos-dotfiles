{pkgs, ...}: {
    home.sessionVariables = {
        XCURSOR_THEME = "WhiteSur";
        XCURSOR_SIZE = "24";
    };
    gtk = {
        enable = true;
        cursorTheme = {
            package = pkgs.whitesur-cursors;
            name = "WhiteSur";
        };
        iconTheme = {
            package = pkgs.whitesur-icon-theme;
            name = "WhiteSur";
        };
        theme = {
            package = pkgs.whitesur-gtk-theme;
            name = "WhiteSur";
        };
    };
}
