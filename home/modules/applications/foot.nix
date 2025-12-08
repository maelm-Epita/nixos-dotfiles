{ pkgs, lib, ...}: {
    programs.foot = {
        enable = true;
        settings = {
            main = {
                notify="off";
                pad="15x15";
                font="cascadiacode:size=14";
            };
            cursor = {
                blink="yes";
            };
            colors = {
                alpha="0.75";
                # Dark
                background="07040d";
                foreground="f4f2f9";
                regular0="261d35"; # black
                regular1="d97780"; # red
                regular2="7aa860";# green
                regular3="bc904f";# yellow
                regular4="6b9bd9";# blue
                regular5="b77ed1";# magenta
                regular6="52a9a9";# cyan
                regular7="b2a2d1";# white
                # Bright
                bright0="584875";# bright black
                bright1="e6949a";# bright red
                bright2="8ebf73";# bright green
                bright3="d3a563";# bright yellow
                bright4="88b1e5";# bright blue
                bright5="c899de";# bright magenta
                bright6="63c0bf";# bright cyan
                bright7="e5dff1";# bright white
            };
        };
    };
}
