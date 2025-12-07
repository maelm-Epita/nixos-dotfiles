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
                alpha="0.6";
            };
        };
    };
}
