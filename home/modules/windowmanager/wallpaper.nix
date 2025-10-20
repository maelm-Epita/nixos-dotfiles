{pkgs, ...}: {
    # Dependencies
    home.packages = with pkgs; [ pywal ];
    services.wpaperd = {
        enable = true;
        settings = {
            default = {
                path = "/home/mael/Images/wallpapers/current/";
                mode = "center";
                duration = "30m";
                initial-transition = false;
                #exec = "${builtins.toString ./.}/scripts/wallpaper-wal.sh";
            };
        };
    };
}
