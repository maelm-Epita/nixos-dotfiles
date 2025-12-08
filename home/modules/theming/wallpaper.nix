{pkgs, ...}: {
    #home.packages = with pkgs; [ imagemagick ];
    #programs.pywal = {
    #    enable = true;
    #    package = pkgs.pywal16;
    #};
    services.wpaperd = {
        enable = true;
        settings = {
            default = {
                path = "/home/mael/Images/wallpapers/current/";
                mode = "center";
                duration = "30m";
                initial-transition = false;
            };
        };
    };
}
