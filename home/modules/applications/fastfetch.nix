{pkgs,...}:
{
    programs.fastfetch = {
        enable = true;
        settings = {
            logo = {
                type = "raw";
                source = "~/Images/autre/miku.sixel";
                padding = {
                    #top = 2;
                    #bottom = 1;
                    left = 10;
                    right = 37;
                };
            };
            modules = [
                "break"
                "users"
                "host"
                "os"
                "packages"
                "wm"
                "break"
                "shell"
                "terminal"
                "break"
                "colors"
            ];
        };
    };
}
