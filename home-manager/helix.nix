{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    ignores = [];

    extraPackages = [
      pkgs.marksman
    ];

    settings = {

      theme = "gruvbox_dark_hard";

      editor = {
        line-number   = "relative";
        true-color    = true;
        bufferline    = "multiple";
        cursor-shape  = {
          insert      = "bar";
          normal      = "block";
          select      = "underline";
        };
        indent-guides = {
          render      = true;
          character   = "┆";
          skip-levels = 1;
        };
        statusline    = {
          left        = ["mode" "separator" "spinner"];
          center    = ["file-name"];
          right       = ["diagnostics" "separator" "position" "separator" "file-type"];
          separator   = "┆";
          mode.normal = " 󰰓 ";
          mode.insert = " 󰰄 ";
          mode.select = " 󰰢 ";
        };

      };

      keys.normal     = {
        esc           = ["collapse_selection" "keep_primary_selection"];
        C-o           = ":config-open";

        space.w       = ":w";
        space.q       = ":q";
        space.x       = ":bc";

        space.space.b = ":set-language bash";
        space.space.s = ":set-language sway";
        space.space.o = ":set-language org";
      };

      keys.insert = {
        j.j = ["normal_mode" "keep_primary_selection"];
      };

    }; ##### Hết settings.

    languages = {

      language-server.typescript-language-server = with pkgs.nodePackages; {
        command = "${typescript-language-server}/bin/typescript-language-server";
        args = [ "--stdio" "--tsserver-path=${typescript}/lib/node_modules/typescript/lib" ];
      };

      language-server.vscode-html-language-server = {
        command = "npx";
        args = ["vscode-html-language-server" "--stdio"];
      };

      language-server.emmet-ls = {
        command = "emmet-ls";
        args = ["--stdio"];
      };

      language = [{
        name = "html";
        auto-format = true;
        language-servers = ["vscode-html-language-server" "emmet-ls"];
        formatter = { command = "prettier"; args = ["--parser" "html"]; };
      }];

    }; ##### Hết languages.

  };
}
