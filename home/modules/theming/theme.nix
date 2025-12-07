{pkgs, ...}: {
    home.packages = with pkgs; [
        libsForQt5.qt5ct
        libsForQt5.qtstyleplugin-kvantum
        whitesur-kde
    ];
    home.sessionVariables = {
        XCURSOR_THEME = "WhiteSur-cursors";
        XCURSOR_SIZE = "24";
        GTK_THEME = "WhiteSur-Dark";
        ICON_THEME = "WhiteSur-dark";
        GTK_APPLICATION_PREFER_DARK_THEME = "1";
        QT_QPA_PLATFORMTHEME = "qt5ct";
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
        platformTheme.name = "qtct";
        style = {
            package = pkgs.whitesur-kde;
        };
        kde.settings = {
            kdeglobals = {
                UiSettings = {
                    ColorScheme = "qt5ct";
                };
            };
        };
    };
    xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=WhiteSurDark
    '';
    home.file.".config/Kvantum/WhiteSurDark".source = "${pkgs.whitesur-kde}/share/Kvantum/WhiteSur";
}
