{config,  ...}: 
let
session = config.home.sessionVariables;
in
{
    programs.zsh = {
        enable = true;
        # -- Autosuggestions -- #
        autosuggestion = {
            enable = true;
            strategy = [ "history" "completion" ];
        };
        # -- Autocompletion -- #
        enableCompletion = true;
        # -- History -- #
        history = {
            append = true;
            ignoreDups = true;
            saveNoDups = true;
        };
        # -- Highlighting -- #
        syntaxHighlighting.enable = true;
        # -- Bindings -- #
        initContent = ''
            bindkey '^N' autosuggest-accept
        '';
        # -- Aliases -- #
        shellAliases = {
            ls="ls -A --color=auto";
            neofetch="fastfetch";
            ccdb="gcc -fsanitize=address -g -std=c99 -pedantic -Werror -Wall -Wextra -Wvla";
            home-rb="home-manager switch --flake ${session.FLAKEDIR}";
            nixos-rb="sudo nixos-rebuild switch --flake ${session.FLAKEDIR}";
        };
    };
}
