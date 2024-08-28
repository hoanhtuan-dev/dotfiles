
# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ config, lib, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./i3.nix
  ];

  # Chấp nhận cài phần mềm bản quyền
  nixpkgs.config.allowUnfree = true;

  security.polkit.enable = true;

  # Menu khởi động GRUB
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable      = true;
      device      = "nodev";
      efiSupport  = true;
      useOSProber = true;
    };
  };

  networking = {
    hostName = "atd";
    networkmanager.enable = true;  
  };

  # Time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
          fcitx5-bamboo
      ];
  };

  security.rtkit.enable = true;

  services = {
    xserver = {
       enable = true;

       # chương trình quản lý màn hình
       desktopManager.xterm.enable = false;

       desktopManager.xfce.enable = true;

       # gnome
       # desktopManager.gnome.enable = false;
       displayManager.gdm.enable   = false;

       # chế độ của cạc đồ họa
       videoDrivers = [ "modesetting" ];

       # layout bàn phím
       xkb.layout = "us";
       xkb.variant = "";

    };

    # mặc định khi ở màn hình dăng nhập
    displayManager = {
      defaultSession = "hyprland";
    };

    # có nên cài đặt phần mềm gnome mặc định hay không?
    # gnome.core-utilities.enable = false;
    # gnome.gnome-keyring.enable = true;

    # hỗ trợ touchpads
    libinput.enable     = true;

    # hỗ trợ máy in
    printing.enable     = true;

    pipewire = {
      enable            = true;
      alsa.enable       = true;
      alsa.support32Bit = true;
      pulse.enable      = true;
      jack.enable       = true;
    };

    # Daemon quan ly bluetoot
    blueman.enable      = true;

  }; # kết thúc services

  hardware = {
    pulseaudio.enable   = false;

    bluetooth = {
     enable             = true; 
     powerOnBoot        = true;
    };

    opengl.driSupport32Bit = true;
    opengl.enable = true;
    # graphics = {
    #   enable = true;
    #   enable32Bit = true;     
    # };

  };

  users.users.anhtuan = {
    isNormalUser = true;
    extraGroups  = [ "wheel" "networkmanager" "video" "kvm" ];
    packages     = with pkgs; [];
  };

  # môi truongf toàn cục
  environment.systemPackages = with pkgs; [
    # vim git
  ];

  programs.light.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  system.stateVersion = "24.05"; 


} 

########## Ghi Chú ##########
# Hiện tại cấu hình này không đc bật đăng nhập tự động.
# Khi đăng nhập thành công sẽ gặp trường hợp màn hình đen.

# Wezterm render tiếng Việt tốt.
# Hiệu suất máy tính ổn định trên laptop


