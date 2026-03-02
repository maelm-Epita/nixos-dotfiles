{pkgs, lib, ...}: {
    programs.hyprlock = {
        enable = true;
        settings = {
            general = {
                hide_cursor = true;
                ignore_empty_input = true;
            };
            animations = {
                enabled = true;
                fade_in = {
                    duration = 300;
                    bezier = "easeOutQuint";
                };
                fade_out = {
                    duration = 300;
                    bezier = "easeOutQuint";
                };
            };
            background = [
                {
                    path = "screenshot";
                    blur_passes = 1;
                    blur_size = 3;
                }
            ];
            image = [
                {
                    size = "150, 150";
                    position = "0, 50";
                    monitor = "";
                    rounding = -1;
                    halign = "center";
                    valign = "center";
                    border_size = 2;
                    path = "~/Images/autre/hatsuneuserpfp.jpg";
                }
            ];
            input-field = [
                {
                    size = "200, 50";
                    position = "0, -120";
                    monitor = "";
                    dots_center = true;
                    fade_on_empty = false;
                    font_color = "rgb(202, 211, 245)";
                    inner_color = "rgb(91, 96, 120)";
                    outer_color = "rgb(24, 25, 38)";
                    outline_thickness = 5;
                    placeholder_text = "Password...";
                    shadow_passes = 2;
                }
            ];
            label = [
                {
                    text = "$USER";
                    font_size = 30;
                    font_family = "Cascadia Code";
                    halign = "right";
                    valign = "bottom";
                    position = "-120, 150";
                }
                {
                    text = "$TIME";
                    font_size = 60;
                    font_family = "Cascadia Code";
                    halign = "right";
                    valign = "bottom";
                    position = "-115, 65";
                }
            ];
        };
    };
}
