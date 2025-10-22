{...}: {
  programs.nixvim.opts = {
    number = true;
    relativenumber = true;
    expandtab = true;
    shiftwidth = 4;
    tabstop = 4;
    softtabstop = 4;
  };
}
