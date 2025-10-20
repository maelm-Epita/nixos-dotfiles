{ pkgs, lib, ...}: {
    programs.foot = {
        enable = true;
        settings = {
            main = {
                pad="15x15";
                font="cascadiacode:size=14";
            };
            cursor = {
                blink="yes";
            };
            colors = {
                background="0c1e2a";
                foreground="e4f7f6";
                regular0="22577A";
                regular1="38A3A5";
                regular2="57CC99";
                regular3="0C907D";
                regular4="FF9B17";
                regular5="FCB454";
                regular6="624E88";
                regular7="CB80AB";
                bright0="bcebeb";
                bright1="a8e5e5";
                bright2="94dfdf";
                bright3="b9ead5";
                bright4="a5e4c9";
                bright5="91debd";
                bright6="eaed86";
                bright7="eed885";
                alpha="0.7";
            };
        };
    };
}
