# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "NIX"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable ly
  services.displayManager.ly.enable = true;
  services.displayManager.ly.settings = {
      animate = true;
      animation = "dur_file";
      bigclock = false;
      hide_f1_commands = true;
      dur_file_path = "/home/okama/.config/ly/blackhole.dur"
      hide_string_version = true;
      hide_key_hints = true
      hide_keyboard_locks = true
    };

  # Define a user account.
  users.users.nakamura = {
    isNormalUser = true;
    description = "NAKAMURA";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;
  
  #Enable steam.
  programs.steam.enable = true;

  # Enable hyprland.
  programs.hyprland.enable = true;

  # Enable nerd fonts.
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Enable flatpak.
  services.flatpak.enable = true;

  # Enable fish.
  programs.fish.enable = true;

  # Enable yazi.
  programs.yazi.enable = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    vim
    gcc
    discord
    kitty
    waybar
    hypridle
    hyprlock
    hyprpaper
    hyprshot
    yazi
    git
    fastfetch
    breeze-cursors
    xdg-user-dirs
    xorg.xcursorthemes
    qbittorrent
    nwg-look
    cmatrix
    cbonsai
    yt-dlp
    vlc
    wlogout
    better-control
    rofi
    wget
    jdk
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
