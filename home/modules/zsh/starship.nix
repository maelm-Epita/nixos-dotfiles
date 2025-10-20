{
    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        enableTransience = true;
        settings = {
            "$schema" = "https://starship.rs/config-schema.json";
            format = "$username(@$hostname) $directory $git_branch \n  [⮑](fg:iris) ";
            right_format = "$cmd_duration";
            add_newline = true;
            palette = "custom";
            palettes.custom= {
                overlay = "#26233a";
                gold = "#f6c177";
                pine = "#31748f";
                rose = "#57CC99";
                foam = "#9ccfd8";
                love = "#93b8e4";
                iris = "#c4a7e7";
                text = "#e0def4";
            };
            directory = {
                format = "[ $path ⛩ ]($style)";
                style = "fg:pine";
                truncation_length = 3;
                truncation_symbol = "…/";
            };
            git_branch = {
                format = "[ $symbol $branch ]($style)";
                style = "fg:foam";
                symbol = "";
            };
            cmd_duration = {
                disabled = false;
                format = "[⏱  took](fg:text) [$duration]($style)";
                style = "fg:iris";
                show_notifications = true;
                min_time = 1000;
                min_time_to_notify = 30000;
            };
            username = {
                disabled = false;
                format = "[☞  $user]($style)";
                show_always = true;
                style_root = "fg:love";
                style_user = "fg:iris";
            };
            hostname = {
                ssh_only = true;
                format = "[$hostname]($style)";
                style = "fg:text";
            };
        };
    };
}
