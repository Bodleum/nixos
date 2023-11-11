{ config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      mode = "drun";
      allow_images = true;
      image_size = 40;
      insensitive = true;
      location = "center";
      no_actions = true;
      prompt = "Search";
    };

    style = ''
      @define-color bg_dim #efebd4;
      @define-color bg0 #fdf6e3;
      @define-color bg1 #f4f0d9;
      @define-color bg2 #efebd4;
      @define-color bg3 #e6e2cc;
      @define-color bg4 #e0dcc7;
      @define-color bg5 #bdc3af;
      @define-color bg_visual #eaedc8;
      @define-color bg_red #fbe3da;
      @define-color bg_green #f0f1d2;
      @define-color bg_blue #e9f0e9;
      @define-color bg_yellow #faedcd;
      @define-color fg #5c6a72;
      @define-color red #f85552;
      @define-color orange #f57d26;
      @define-color yellow #dfa000;
      @define-color green #8da101;
      @define-color aqua #35a77c;
      @define-color blue #3a94c5;
      @define-color purple #df69ba;
      @define-color grey0 #a6b0a0;
      @define-color grey1 #939f91;
      @define-color grey2 #829181;

      * {
          font-family: JetBrainsMono Nerd Font, FontAwesome;
          font-size: 17px;
          border-radius: 10px;
          border: none;
      }

      window {
          margin: 0px;
          background-color: @fg;
          color: @bg0;

      	border-radius: 15px;

          border-bottom-width: 5px;
          border-bottom-color: #2e3538;
          border-bottom-style: solid;
      }

      #outer-box {
          margin: 0px;
          border-radius: 0px;
      }

      #input {
          background-color: @green;
          color: @bg0;

          margin: 15px;
          padding: 10px;
          border: none;

          border-bottom-width: 5px;
          border-bottom-color: #465000;
          border-bottom-style: solid;
      }

      #inner-box {
          margin: 20px;
          padding: 0px;
          border-radius: 0px;
          background-color: #00000000;
      }

      #scroll {
          margin: 0px;
          padding: 0px;
          border: none;
      }

      #text {
          margin-left: 15px;
          margin-right: 15px;
      }

      #entry {
          border: none;
          padding: 10px;
          margin: 0px;
      }

      #entry:selected {
          background-color: @bg0;
          color: @fg;

          border-bottom-width: 5px;
          border-bottom-color: @bg5;
          border-bottom-style: solid;
      }
    '';
  };
}
