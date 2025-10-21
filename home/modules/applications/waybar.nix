{pkgs, lib, ...}: {
	programs.waybar = {
		enable = true;
        #style = {
        #};
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
					"pulseaudio"
						"pulseaudio/slider"
						"backlight"
						"backlight/slider"
						"network"
						"hyprland/language"
                        "custom/power-profile"
						"battery"
						"custom/power"
				];
				clock = {
					timezone = "Europe/Paris";
					tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
					format-alt = "{:%Y-%m-%d}";
				};
				cpu = {
					format = "{usage}% ";
					tooltip = false;
				};
				backlight = {
					format = "{percent}% ✶";
					tooltip-format = "{percent}% Brightness";
				};
				"backlight/slider" = {
					min=5;
					format = "{percent}% {icon}";
					format-icons = ["" "" "" "" "" "" "" "" ""];
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
				network = {
					format-wifi = "{essid} ({signalStrength}%) ";
					format-ethernet = "Ethernet: {ipaddr}/{cidr} 🖧 ";
					tooltip-format = "{ifname} via {gwaddr} ";
					format-linked = "{ifname} (No IP) ";
					format-disconnected = "Disconnected ⚠";
					on-click = "foot nmtui";
				};
				pulseaudio = {
					format = "{volume}% {icon} {format_source}";
					format-bluetooth = "{volume}% {icon} {format_source}";
					format-bluetooth-muted = "{icon} {format_source}";
					format-muted = "✖ {format_source}";
					format-source = "{volume}% ";
					format-source-muted = "";
					format-icons = {
						headphone = "";
						hands-free = "☊";
						headset = "☊";
						phone = "";
						portable = "";
						car = "";
						default = ["" "" ""];
					};
					on-click = "pavucontrol";
				};
				"hyprland/language" = {
					on-click = "hyprctl switchxkblayout at-translated-set-2-keyboard next";
				};
				"hyprland/window" = {
					max-length = 40;
					icon = true;
					icon-size = 20;
				};
				"custom/power-profile" = {
                    exec = "powerprofilesctl get";
					format = "Profile: {} ⚡︎";
                    interval = 5;
				};
				"custom/power" = {
					format = " ⏻ ";
					tooltip = false;
					menu = "on-click";
					menu-file = "/hom/mael/.config/waybar/power_menu.xml";
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
