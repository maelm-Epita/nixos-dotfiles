{pkgs, ...}: {
    services.wpaper = {
        enable = true;
        settings = {
            duration = "30m";
            mode = "center";
            path = "/home/mael/Images/wallpapers/current/";
            initial-transition = false;
        };
    };
}
