{pkgs, ...}: {
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
