{pkgs, ...}: {
    home.sessionVariables = {
        XCURSOR_THEME = "WhiteSur-cursors";
        XCURSOR_SIZE = "24";
        GTK_THEME = "WhiteSur-Dark";
        ICON_THEME = "WhiteSur-dark";
        GTK_APPLICATION_PREFER_DARK_THEME = "1";
        QT_QPA_PLATFORMTHEME = "qt5ct";
        QT_STYLE_OVERRIDE = "kvantum";
    };
    gtk = {
        enable = true;
        cursorTheme = {
            package = pkgs.whitesur-cursors;
            name = "WhiteSur-cursors";
        };
        iconTheme = {
            package = pkgs.whitesur-icon-theme;
            name = "WhiteSur-dark";
        };
        theme = {
            package = pkgs.whitesur-gtk-theme;
            name = "WhiteSur-Dark";
        };
    };
    qt = {
        enable = true;
        platformTheme = "qt5ct";
        style = {
            package = pkgs.kvantum;
            name = "kvantum";
        };
    };
    xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=WhiteSur-Dark
    '';
}
