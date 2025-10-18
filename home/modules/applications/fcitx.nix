{pkgs, ...}: {
    home.sessionVariables = {
        # -- FCITX -- #
        GTK_IM_MODULE="fcitx";
        QT_IM_MODULE="fcitx";
        XMODIFIERS="@im=fcitx";
        IMSETTINGS_MODULE="fcitx";
        SDL_IM_MODULE="fcitx";
        INPUT_METHOD="fcitx";
    };
    i18n.inputMethod = {
        type = "fcitx5";
        enable = true;
        fcitx5 = {
            waylandFrontend = true;
            addons = with pkgs; [
                fcitx5-mozc
                fcitx5-gtk
            ];
        };
    };
}
