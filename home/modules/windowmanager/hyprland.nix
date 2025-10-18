{config, pkgs, ...}: 
let
session = config.home.sessionVariables;
in
{
# -- Dependencies -- #

    home.packages = with pkgs; [
        grim
        slurp
        pamixer
        brightnessctl
    ];
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
# ---------------- #


# -- Hyprland related -- #
    home.sessionVariables = {
        FLAKEDIR = "~/dotfiles/"; # Not portable so it may need to be changed
        TERMINAL = "foot";
        LAUNCHER = "rofi -show drun -location 2 --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto";
        FILEMANAGER = "thunar";
        SCREENSHOT = "grim -g \\$(slurp -d) - | wl-copy";
        LOCK = "swaylock --screenshots --ignore-empty-password --daemonize --indicator-caps-lock --indicator --clock --show-failed-attempts --indicator-idle-visible";
        POWERPROFILE = "${builtins.toString ./.}/scripts/power-profile-switch.sh";
    };

    services.hyprpaper = {
        enable = true;
        settings = {
            preload = [ "/home/mael/Downloads/temp_wall.jpg" ];
            wallpaper = [ "/home/mael/Downloads/temp_wall.jpg" ];
        };
    };

    wayland.windowManager.hyprland = { 
        enable = true;
        settings = {
            exec-once=[
                "waybar"
                "fcitx5 -d -r --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime"
            ];
            monitor = [
                "eDP-1,1920x1080@120,0x0,1"
                 "HDMI-A-1,1920x1080@120,0x0,1"
            ];
            input = {
                kb_layout = [ "us" ];
                follow_mouse = 1;
                touchpad = {
                    natural_scroll = "yes";
                };
                sensitivity = 0;
            };
            general = {    
                gaps_in = 0;
                gaps_out = 10;
                border_size = 2;
                "col.active_border" = "rgba(FFFFFFFF)";
                layout = "dwindle";
                allow_tearing = false;
            };
            decoration = {
                rounding = 0;

                blur = {
                    enabled = true;
                    size = 2;
                    passes = 3;
                    vibrancy = 0.5 ;
                };
                shadow = {
                    enabled = true;
                    range = 20;
                    render_power = 3;
                    color = "rgba(00000099)";
                };
            };
            animations = {
                enabled = "yes";
                bezier = "myBezier, 0.05, 0.9, 0.1, 1.0";
                animation = [
                    "windows, 1, 7, myBezier"
                     "windowsOut, 1, 7, default, popin 80%"
                     "border, 1, 10, default"
                     "borderangle, 1, 8, default"
                     "fade, 1, 7, default"
                     "workspaces, 1, 6, default"
                ];
            };
            misc = {
                force_default_wallpaper = -1;
            };
            group = {
                "col.border_active" = "rgba(FFFFFFFF)";
                "col.border_inactive" = "rgba(FFFFFF4F)";
                groupbar = {
                font_family = "Cascadiacode";
                height = 2;
                render_titles = false;
                "col.active" = "rgba(FFFFFFFF)";
                "col.inactive" = "rgba(FFFFFF55)";
                };
            };
            windowrule = [
                ''pseudo, class:^(fcitx)$''
            ];
            "$mod" = "SUPER";
            bind = [
# execute apps
                "$mod, Q, exec, ${session.TERMINAL}"
                 "$mod, R, exec, ${session.LAUNCHER}"
                 "$mod, E, exec, ${session.FILEMANAGER}"
                 "$mod, S, exec, bash -c \"${session.SCREENSHOT}\""
                 "$mod, P, exec, bash -c \"${session.POWERPROFILE}\""
                 ", XF86PowerOff, exec, ${session.LOCK}"
# main shortcuts
                 "$mod, C, killactive"
                 "$mod, V, togglefloating"
                 "$mod, F, fullscreen"
                 "$mod, H, movefocus, l"
                 "$mod, J, movefocus, d"
                 "$mod, K, movefocus, u"
                 "$mod, L, movefocus, r"
                 "$mod SHIFT, H, movewindow, l"
                 "$mod SHIFT, J, movewindow, d"
                 "$mod SHIFT, K, movewindow, u"
                 "$mod SHIFT, L, movewindow, r"
                 "$mod, Z, exec, hyprctl switchxkblayout at-translated-set-2-keyboardd next"
# workspaces
                 "$mod, 1, workspace, 1"
                 "$mod, 2, workspace, 2"
                 "$mod, 3, workspace, 3"
                 "$mod, 4, workspace, 4"
                 "$mod, 5, workspace, 5"
                 "$mod, 6, workspace, 6"
                 "$mod, 7, workspace, 7"
                 "$mod, 8, workspace, 8"
                 "$mod, 9, workspace, 9"
                 "$mod, 0, workspace, 10"
                 "$mod SHIFT, 1, movetoworkspace, 1"
                 "$mod SHIFT, 2, movetoworkspace, 2"
                 "$mod SHIFT, 3, movetoworkspace, 3"
                 "$mod SHIFT, 4, movetoworkspace, 4"
                 "$mod SHIFT, 5, movetoworkspace, 5"
                 "$mod SHIFT, 6, movetoworkspace, 6"
                 "$mod SHIFT, 7, movetoworkspace, 7"
                 "$mod SHIFT, 8, movetoworkspace, 8"
                 "$mod SHIFT, 9, movetoworkspace, 9"
                 "$mod SHIFT, 0, movetoworkspace, 10"
# FN keys
                 ", XF86AudioLowerVolume, exec, pamixer -d 5 Master"
                 ", XF86AudioRaiseVolume, exec, pamixer -i 5 Master"
                 ", XF86AudioMute, exec, pamixer -t Master"
                 ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
                 ", XF86MonBrightnessDown, exec, brightnessctl set 5%+"
                 ];
            bindm = [
                "$mod, mouse:272, movewindow"
                 "$mod, mouse:273, resizewindow"
            ];
        };
    };
}
