# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, silentSDDM,...}:
let 
    sddm-theme = let
        background = pkgs.fetchurl {
            url = "https://raw.githubusercontent.com/maelm-Epita/nixos-dotfiles/refs/heads/master/other/plains.png";
            hash = "sha256-IoHzg4uFDbbO/4VW75W0Cb+chDntlN+utEA3sT9p/is=";
        };
    in silentSDDM.packages.${pkgs.system}.default.override {
            theme = "default";
            extraBackgrounds = [ background ];
            theme-overrides = {
                "LoginScreen" = {
                    blur = 3;
                    use-background-color = true;
                    background-color = "#000000FA";
                    background = "${background.name}";
                };
                "LockScreen" = {
                    blur = 3;
                    use-background-color = true;
                    background-color = "#000000FA";
                    background = "${background.name}";
                };
            };
        };
in
{
    imports =
        [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ];

    # -- BOOT LOADER -- #
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    # Use latest kernel.
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # -- NETWORKING -- #
    networking.hostName = "elitebook";
    networking.networkmanager.enable = true;
    # -- ZEROTIER -- #
    services.zerotierone = {
        enable = true;
        joinNetworks = [
            "a581878f7d4e60a9"
        ];
    };

    # -- AUDIO -- #
    security.rtkit.enable = true;
    services.pulseaudio.enable = false;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };

    # -- BLUETOOTH -- #
    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
    };

    # -- TIME / LANGUAGE -- #
    # Set your time zone.
    time.timeZone = "Europe/Paris";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "fr_FR.UTF-8";
        LC_IDENTIFICATION = "fr_FR.UTF-8";
        LC_MEASUREMENT = "fr_FR.UTF-8";
        LC_MONETARY = "fr_FR.UTF-8";
        LC_NAME = "fr_FR.UTF-8";
        LC_NUMERIC = "fr_FR.UTF-8";
        LC_PAPER = "fr_FR.UTF-8";
        LC_TELEPHONE = "fr_FR.UTF-8";
        LC_TIME = "fr_FR.UTF-8";
    };
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # -- USER -- #
    users.users.mael = {
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.zsh;
    };
    security.sudo.wheelNeedsPassword = false;

    # -- BATTERY -- #
    services.upower.enable = true;
    services.power-profiles-daemon.enable = true;
    systemd.services.set-default-power-profile = {
        description = "Set default power profile at boot to balanced";
        after = [ "power-profiles-daemon.service" ];
        wants = [ "power-profiles-daemon.service" ];
        serviceConfig = {
            Type = "oneshot";
            ExecStart = [ "${pkgs.power-profiles-daemon}/bin/powerprofilesctl set balanced" ];
        };
        wantedBy = [ "default.target" ];
    };
    services.udev.extraRules = ''
    SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ACTION=="change", RUN+="${pkgs.systemd}/bin/systemctl start ac-adapter-change.service"
    '';

    systemd.services.ac-adapter-change = {
        description = "Switch power profile when AC adapter changes state";
        serviceConfig = {
            Type = "oneshot";
            ExecStart = [
                (pkgs.writeShellScript "ac-adapter-change" ''
                    PROFILE_FILE="/run/ac-adapter-change-previous-profile"
                    if grep -q 1 /sys/class/power_supply/AC/online; then
                        echo "$(${pkgs.power-profiles-daemon}/bin/powerprofilesctl get)" > "$PROFILE_FILE"
                        ${pkgs.power-profiles-daemon}/bin/powerprofilesctl set performance
                    else
                        if [ -f "$PROFILE_FILE" ]; then
                            profile=$(cat "$PROFILE_FILE")
                        else
                            profile="balanced"
                        fi
                        ${pkgs.power-profiles-daemon}/bin/powerprofilesctl set "$profile"
                    fi
                '')
            ];
        };
    };

    # -- PACKAGES -- #
    # Programs I need to enable system wide because of permissions
    programs.hyprland.enable = true;
    programs.zsh.enable = true;
    programs.steam = {
        enable = true;
        extraPackages = with pkgs; [
            pkgsi686Linux.glibc
        ];
    };
    nixpkgs.config.allowUnfree = true;
    # Basic needed packages
    environment.systemPackages = with pkgs; [
        vim
        git
        glibc
        glibc_multi

        sddm-theme 
        sddm-theme.test
    ];

    # -- SERVICES -- #
    services.tumbler.enable = true; # Get thumbnails for file managers
    services.openssh.enable = true;
    services.displayManager = {
        sddm = {
            package = pkgs.kdePackages.sddm;
            enable = true;
            wayland.enable = true;
            theme = sddm-theme.pname;
            extraPackages = sddm-theme.propagatedBuildInputs;
            settings = {
                General = {
                    GreeterEnvironment = "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/themes/${sddm-theme.pname}/components/,QT_IM_MODULE=qtvirtualkeyboard";
                    InputMethod = "qtvirtualkeyboard";
                };
            };
        };
    };
    services.logind.settings.Login.HandlePowerKey = "ignore";

    # -- USB AUTOMOUNT -- #
    services.udisks2.enable = true;

    # -- MAN PAGES -- #
    documentation.enable = true;

    # -- OPENGL -- #
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };

    # -- NIX SYSTEM -- #
    nix.settings.experimental-features = [ "nix-command" "flakes" ];


    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.05"; # Did you read the comment?

}
