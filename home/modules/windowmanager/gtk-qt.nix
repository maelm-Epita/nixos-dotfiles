{pkgs, ...}: {
    gtk = {
        enable = true;
        font.name = "Cascadia Code";
        cursorTheme = {
            package = "whitesur-cursors";
            name = "WhiteSur-cursors";
        };
        iconTheme = {
            package = "whitesur-icon-theme";
            name = "WhiteSur";
        };
        theme = {
            package = "whitesur-gtk-theme";
            name = "WhiteSur";
        };
    };
}
