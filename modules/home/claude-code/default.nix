{
  programs.claude-code = {
    enable = true;
    # becomes ~/.claude/CLAUDE.md
    context = ./global-instructions.md;
  };

  home.mergeJson.".claude.json" = ./config.json;
}
