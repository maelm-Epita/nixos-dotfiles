{pkgs, lib, ...}: {
    programs.eww = {
        enable = true;
        configDir = ./eww;
    };

    # TODO make tray for profile + wifi + language
    # TODO make one custom thing for backlight + sound that brings up a menu
    # TODO make notifications for volume and profile change
	programs.waybar = {
		enable = true;
        style = ./style.css;
		settings = {
			bar = {
				position = "top";
				height = 30;
				spacing = 4;
				modules-left = [
					"hyprland/workspaces"
						"clock"
				];
				modules-center = [
					"hyprland/window"
				];
				modules-right = [
                    "network"
                    "hyprland/language"
                    "custom/power-profile"
                    "custom/other-tray"
                    "custom/audio-backlight-tray"
                    "battery"
                    "custom/power"
				];
				clock = {
					timezone = "Europe/Paris";
					tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
					format-alt = "{:%Y-%m-%d}";
				};
				"hyprland/window" = {
					max-length = 40;
					icon = true;
					icon-size = 20;
				};
				network = {
                    #format-wifi = "{essid} ({signalStrength}%) ";
					format-wifi = "{essid} ";
					format-ethernet = "Ethernet: {ipaddr}/{cidr} 🖧 ";
					tooltip-format = "{ifname} via {gwaddr} ";
					format-linked = "{ifname} (No IP) ";
					format-disconnected = "Disconnected ⚠";
                    #on-click = "foot nmtui";
				};
				"hyprland/language" = {
                    #on-click = "hyprctl switchxkblayout at-translated-set-2-keyboard next";
                    format = "{}";
                    # TODO make tray
				};
				"custom/power-profile" = {
                    exec = "powerprofilesctl get";
					format = "{} ⚡︎";
                    interval = 1;
				};
                "custom/settings-tray" = {
                    format = " ⚙  ";
                };
                "custom/audio-backlight-tray" = {
                    format = " ☀︎ |   ⌄ "; 
                    on-click = "${builtins.toString ./.}/eww/eww_wrapper.sh volume-brightness-menu";
                };
				battery = {
					states = {
						warning = 30;
						critical = 15;
					};
					format = "{capacity}% {icon}";
					format-full = "{capacity}% {icon}";
					format-charging = "{capacity}% ⚡︎";
					format-plugged = "{capacity}% ";
					format-icons = ["" "" "" "" ""];
				};
				"custom/power" = {
					format = " ⏻ ";
					tooltip = false;
					menu = "on-click";
					menu-file = ./menus/power_menu.xml;
					menu-actions = {
						shutdown = "shutdown now";
						reboot = "reboot";
						suspend = "systemctl suspend";
						lock = "swaylock";
					};
				};
			};
		};
	};
}
