{pkgs, lib, ...}: {
	programs.swaylock = {
		enable = true;
		settings = {
			ignore-empty-password = true;
			show-failed-attempts = true;
			indicator-idle-visible = true;
			indicator-caps-lock = true;
			font="Cascadia Code";
			font-size=35;

			clock;
			timestr="%R";
			datestr="%a %e, %B";

			screenshots;
			effect-blur="5x10";
			effect-scale=1;

			indicator;
			indicator-radius=160;
			indicator-thickness=22;

			separator-color="e0def4FF";

			bs-hl-color="ebbcbaFF";
			caps-lock-bs-hl-color="ebbcbaFF";
			key-hl-color="c4a7e7FF";
			caps-lock-key-hl-color="c4a7e7FF";
			inside-color="1f1d2eFF";
			inside-caps-lock-color="1f1d2eFF";
			inside-ver-color="1f1d2eFF";
			inside-wrong-color="1f1d2eFF";
			inside-clear-color="1f1d2eFF";
			layout-bg-color="1f1d2eFF";
			layout-border-color="1f1d2eFF";
			line-color="c4a7e7FF";
			line-clear-color="c4a7e7FF";
			line-caps-lock-color="c4a7e7FF";
			line-ver-color="c4a7e7FF";
			line-wrong-color="c4a7e7FF";
			ring-color="907aa9FF";
			ring-clear-color="#e0def4";
			ring-caps-lock-color="907aa9FF";
			ring-ver-color="#c4a7e7";
			ring-wrong-color="#eb6f92";
			text-color="e0def4FF";
			layout-text-color="e0def4FF";
			text-clear-color="e0def4FF";
			text-caps-lock-color="e0def4FF";
			text-ver-color="e0def4FF";
			text-wrong-color="e0def4FF";
    };
  };
}
