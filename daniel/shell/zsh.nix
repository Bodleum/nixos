{config, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    defaultKeymap = "viins";
    dotDir = ".config/zsh";
    enableVteIntegration = true;
    history.path = "${config.xdg.dataHome}/zsh/zsh_history";
    envExtra = ''
      # ---   Cleanup   ---
      # export GNUPGHOME="''${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"

      # ---   Colour man pages   ---
      export LESS_TERMCAP_mb=$'\e[1;32m'
      export LESS_TERMCAP_md=$'\e[1;32m'
      export LESS_TERMCAP_me=$'\e[0m'
      export LESS_TERMCAP_se=$'\e[0m'
      export LESS_TERMCAP_so=$'\e[01;33m'
      export LESS_TERMCAP_ue=$'\e[0m'
      export LESS_TERMCAP_us=$'\e[1;4;31m'
    '';
    initExtra = ''
      # Set prompt
      [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

      setopt autocd
      setopt autopushd

      fancy-ctrl-z () {
        if [[ $#BUFFER -eq 0 ]]; then
          fg
          zle redisplay
        else
          zle push-input
        fi
      }
      zle -N fancy-ctrl-z
      bindkey '^Z' fancy-ctrl-z
    '';
  };
}
