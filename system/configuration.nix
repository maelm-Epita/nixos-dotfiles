# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

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

    # -- AUDIO -- #
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
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



    # -- PACKAGES -- #
    # Programs I need to enable system wide because of permissions
    programs.hyprland.enable = true;
    programs.zsh.enable = true;
    nixpkgs.config.allowUnfree = true;
    # Basic needed packages
    environment.systemPackages = with pkgs; [
        vim
        git
    ];

    # -- SERVICES -- #
    services.openssh.enable = true;
    services.displayManager = {
        sddm = {
            enable = true;
            wayland.enable = true;
        };
    };
    services.logind.settings.Login.HandlePowerKey = "ignore";

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
