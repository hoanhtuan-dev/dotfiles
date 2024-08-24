
{ config, lib, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      # ./nouveau.nix
      ./i3.nix
  ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber =true;
  };

  networking.hostName = "atd";

  # networking.wireless.enable = true; 
  networking.networkmanager.enable = true;  

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

# Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.inputMethod = {
   enabled = "ibus";
   ibus.engines = with pkgs.ibus-engines; [
     bamboo
   ];
  };

  nixpkgs.config.allowUnfree = true;

  # Enable the X11 windowing system.
  services.xserver = {
     enable = true;
     desktopManager.xterm.enable = false;
     desktopManager.gnome.enable = true;
     # desktopManager.xfce.enable =true;
     displayManager.gdm.enable = true;
     xkb.layout = "us";
     xkb.variant = "";

  };

  # services.displayManager = {
    # defaultSession = "none+i3";
  # };

  security.rtkit.enable = true;

  services = {
    gnome.core-utilities.enable = false;

    printing.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true;
    opengl.driSupport32Bit = true;
    opengl.enable = true;
  };

  users.users.anhtuan = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "kvm" ];
    packages = with pkgs; [
      qutebrowser
      wezterm
    ];
  };

  environment.systemPackages = with pkgs; [
    vim neovim helix wget git wezterm
  ];

  programs.light.enable = true;

  system.stateVersion = "24.05"; 

} 
###### End configuratios

