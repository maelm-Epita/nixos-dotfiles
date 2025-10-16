{pkgs, ...}: {

    home.packages = with pkgs; [
        #fcitx5
        #fcitx5-configtool
        #fcitx5-mozc
    ];
    i18n.inputMethod = {
        type = "fcitx5";
        enable = true;
        fcitx5.addons = with pkgs; [
            fcitx5-mozc
            fcitx5-gtk
        ];
    };
}
