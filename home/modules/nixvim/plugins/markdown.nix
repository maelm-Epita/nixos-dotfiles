{
  # DEPS
  withPython3 = true;
  extraPython3Packages = p: [ p.pylatexenc ];

  plugins.render-markdown = {
    enable = true;
  };
  plugins.markdown-preview =
  {
    enable = true;
  };
}
