{pkgs, ...}: {
    services.tumbler.enable = true;
    home.packages = with pkgs; [
        tumbler
        gdk-pixbuf
        ffmpegthumbnailer
    ];
}
