{
  programs.claude-code = {
    enable = true;
    # becomes ~/.claude/CLAUDE.md, the Code tab in Claude desktop reads it too
    context = ./global-instructions.md;
  };

  home.mergeJson.".claude.json" = ./config.json;
}
