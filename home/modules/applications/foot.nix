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
                #background="000000";
                #foreground="e4f7f6";
                #regular0="24311d";
                #regular1="dea870";
                #regular2="38A3A5";
                #regular3="57CC99";
                #regular4="30467a";
                #regular5="5ca549";
                #regular6="8ba045";
                #regular7="e0e5e8";
                #bright0="bcebeb";
                #bright1="a8e5e5";
                #bright2="94dfdf";
                #bright3="b9ead5";
                #bright4="a5e4c9";
                #bright5="91debd";
                #bright6="eaed86";
                #bright7="eed885";
                alpha="0.5";
            };
        };
    };
}
