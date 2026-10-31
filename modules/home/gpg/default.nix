{
  programs.gpg = {
    enable = true;
    publicKeys = [
      {
        source = ./public-key.txt;
        trust = "ultimate";
      }
    ];
  };

  home.file.".gnupg/gpg-agent.conf" = {
    source = ./gpg-agent.conf;
    force = true;
  };
}
