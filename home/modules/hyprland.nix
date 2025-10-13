{config, pkgs, lib, ...}: 
let
  session = config.home.sessionVariables;
in
{
    wayland.windowManager.hyprland = { 
    enable = true;
    settings = {
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
      "$mod" = "SUPER";
      bind = [
      	# execute apps
        "$mod, Q, exec, ${session.TERMINAL}"
	"$mod, R, exec, ${session.LAUNCHER}"
	"$mod, E, exec, ${session.FILEMANAGER}"
	"$mod, S, exec, ${session.SCREENSHOT}"
	"$mod, M, exec, ${session.OCR}"
	"$mod, L, exec, ${session.LOCK}"
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
	", XF86AudioLowerVolume, exec, amixer set master 5%-"
	", XF86AudioRaiseVolume, exec, amixer set master 5%+"
	", XF86AudioMute, exec, amixer set Master toggle"
	", XF86MonBrightnessDown, exec, backlight_control -10"
	", XF86MonBrightnessDown, exec, backlight_control +10"
      ];
      bindm = [
	"$mod, mouse:272, movewindow"
	"$mod, mouse:273, resizewindow"
      ];
    };
  };
}
