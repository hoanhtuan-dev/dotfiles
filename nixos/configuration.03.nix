
{ config, lib, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./i3.nix
  ];
  # Chấp nhận cài phần mềm bản quyền
  nixpkgs.config.allowUnfree = true;

  # Menu khởi động GRUB
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber =true;
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
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
       bamboo
    ];
  };

  security.rtkit.enable = true;

  services = {
    xserver = {
       enable = true;

       # chương trình quản lý màn hình
       desktopManager.xterm.enable = false;
       # gnome
       desktopManager.gnome.enable = true;
       displayManager.gdm.enable = true;

       # chế độ của cạc đồ họa
       videoDrivers = [ "modesetting" ];

       # layout bàn phím
       xkb.layout = "us";
       xkb.variant = "";

    };

    # mặc định khi ở màn hình dăng nhập
    displayManager = {
      defaultSession = "none+i3";
      # bật tự động đăng nhập
      # autoLogin.enable = true;
      # tự động đăng nhập bằng tài khoản đã cho
      # autoLogin.user = "anhtuan";
    };

    # có nên cài đặt phần mềm gnome mặc định hay không?
    gnome.core-utilities.enable = false;

    # hỗ trợ touchpads
    libinput.enable = true;

    # hỗ trợ máy in
    printing.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

  }; # kết thúc services

  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true;

    opengl = {
      driSupport32Bit = true;
      enable = true;
    };
  };

  users.users.anhtuan = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "kvm" ];
    packages = with pkgs; [
      qutebrowser
      wezterm
    ];
  };

  # môi truongf toàn cục
  environment.systemPackages = with pkgs; [
    vim neovim helix wget git wezterm
  ];

  programs.light.enable = true;

  system.stateVersion = "24.05"; 

} 

########## Ghi Chú ##########
# Hiện tại cấu hình này không đc bật đăng nhập tự động.
# Khi đăng nhập thành công sẽ gặp trường hợp màn hình đen.

# Wezterm render tiếng Việt tốt.
# Hiệu suất máy tính ổn định trên laptop


