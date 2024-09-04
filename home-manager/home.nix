{pkgs, ... }:

{

  imports = [
    ./neovim.nix
  ];

  home.enableNixpkgsReleaseCheck = false;

  programs.home-manager.enable = true;

  home = {
    username          = "anhtuan";
    homeDirectory     = "/home/anhtuan";
    stateVersion      = "24.05"; 
    sessionVariables  = { 
        EDITOR        = "hx"; 
        VISUAL        = "hx";
        TERMINAL      = "kitty";
        BROWSER       = "chromium";
        IMAGE_EDITOR  = "gimp";
        FILE_MANAGER  = "nemo";
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

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
        export GTK_IM_MODULE=fcitx
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
        export GTK_IM_MODULE=fcitx
      '';
    };

  };

  home.packages = with pkgs; [
    bat                 blender               btop
    cava                chromium              clang
    clang               colorpicker           yt-dlp
    copyq               eza                   feh
    glaxnimate          glow                  go
    hyprpicker          imv                   smile
    inkscape            kdenlive              kitty
    krita               tuxtype               lazygit
    mako                mpv                   neofetch
    nodejs              wl-clipboard          pulseaudio
    python3             qutebrowser           klavaro
    ripgrep             rofi                  swaybg
    swaylock            tenacity              translate-shell
    tree                unzip                 vim
    vlc                 waybar                yazi
    yewtube             zig                   godot_4
    zoxide              hyprpicker            hyprshot
    ffmpeg-full         foot                  wayfarer    
    gimp                cargo                 marktext

    libsForQt5.qtstyleplugin-kvantum
    nemo-with-extensions

  ];

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
