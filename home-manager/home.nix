{ config, pkgs, inputs, ... }:

{

  home = {
    username = "anhtuan";
    homeDirectory = "/home/anhtuan";
    stateVersion = "24.05"; 
    sessionVariables = { 
        EDITOR = "hx"; 
        VISUAL="hx";
      };
  };

  home.packages = [
    pkgs.python3        pkgs.nodejs           pkgs.qutebrowser
    pkgs.chromium       pkgs.ranger           pkgs.helix
    pkgs.unzip          pkgs.tree             pkgs.btop
    pkgs.vim            pkgs.imv              pkgs.vlc
    pkgs.mpv            pkgs.translate-shell  pkgs.wezterm
    pkgs.wl-clipboard   pkgs.waybar           pkgs.gimp
    pkgs.krita          pkgs.eza              pkgs.pulseaudio
    pkgs.blender        pkgs.inkscape         pkgs.feh
    pkgs.kdenlive       pkgs.flameshot        pkgs.wezterm
    pkgs.zoxide         pkgs.picom-pijulius   pkgs.yazi
    pkgs.colorpicker    pkgs.ffmpeg-full      pkgs.tenacity
    pkgs.glaxnimate     pkgs.clang            pkgs.ktouch
    pkgs.clang          pkgs.lazygit          pkgs.yewtube
    pkgs.zig            pkgs.ripgrep          pkgs.cava
    pkgs.bat            pkgs.go               pkgs.rofi
    pkgs.eww            pkgs.copyq
  ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "AnhTuanDev";
    userEmail = "tuan.ho.designer@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.fzf = { enable = true; };

  programs.bash = {
    enable = true;
    initExtra = ''
      source "$(fzf-share)/completion.bash";
      source "$(fzf-share)/key-bindings.bash";
    '';
    shellAliases = {};
    bashrcExtra = ''
      source ~/.dotfiles/bashrc.sh
    '';
  };

}
