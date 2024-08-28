{ config, pkgs, inputs, ... }:

{

  # imports = [
  #   ./hyprland.nix
  # ];

  home.enableNixpkgsReleaseCheck = false;

  home = {
    username          = "anhtuan";
    homeDirectory     = "/home/anhtuan";
    stateVersion      = "24.05"; 
    sessionVariables  = { 
        EDITOR        = "hx"; 
        VISUAL        = "hx";
        TERMINAL      = "wezterm";
        GTK_IM_MODULE = "fcitx";
      };
  };

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "Gruvbox-GTK-Theme";
    };
    iconTheme = {
      package = pkgs.gruvbox-plus-icons;
      name = "Gruvbox-Plus-Dark";
    };
    font = {
      name = "MesloLGM Nerder Font";
      size = 11;
    };

  };

  home.packages = [
    pkgs.python3        pkgs.nodejs           pkgs.qutebrowser
    pkgs.chromium       pkgs.ranger           pkgs.helix
    pkgs.unzip          pkgs.tree             pkgs.btop
    pkgs.vim            pkgs.imv              pkgs.vlc
    pkgs.mpv            pkgs.translate-shell  pkgs.tilix
    pkgs.krita          pkgs.eza              pkgs.pulseaudio
    pkgs.blender        pkgs.inkscape         pkgs.feh
    pkgs.kdenlive       pkgs.flameshot        pkgs.foot
    pkgs.zoxide         pkgs.picom-pijulius   pkgs.yazi
    pkgs.colorpicker    pkgs.ffmpeg-full      pkgs.tenacity
    pkgs.glaxnimate     pkgs.clang            pkgs.ktouch
    pkgs.clang          pkgs.lazygit          pkgs.yewtube
    pkgs.zig            pkgs.ripgrep          pkgs.cava
    pkgs.bat            pkgs.go               pkgs.rofi
    pkgs.copyq          pkgs.waybar           pkgs.alacritty
    pkgs.neofetch       pkgs.wezterm          pkgs.swaybg
  ];

  programs.home-manager.enable = true;

  programs.git           = {
    enable               = true;
    package              = pkgs.gitAndTools.gitFull;
    userName             = "AnhTuanDev";
    userEmail            = "tuan.ho.designer@gmail.com";
    extraConfig          = {
      init.defaultBranch = "main";
    };
  };

  programs.fzf           = { enable = true; };

  programs.bash          = {
    enable               = true;
    initExtra            = ''
      source "$(fzf-share)/completion.bash";
      source "$(fzf-share)/key-bindings.bash";
    '';
    # shellAliases         = {};
    bashrcExtra          = ''
      source ~/.dotfiles/bashrc.sh
    '';
  };

}
