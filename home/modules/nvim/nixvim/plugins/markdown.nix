{
  # DEPS
  withPython3 = true;
  extraPython3Packages = [ p.pylatexenc ];

  plugins = {
    render-markdown.enable = true;
    markdown-preview.enable = true;
  };
}
