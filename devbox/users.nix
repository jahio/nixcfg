{
  users.extraUsrs.jah = {
    isNormalUser = true;
    home         = "/home/jah";
    uid          = 1000;
    description  = "ENSLAVE YOUR DEMONS";
    extraGroups  = [ "networkManager" "wheel" ];
  };

  users.extraUsers.guest = {
    isNormalUser = true;
    home         = "/home/guest";
    description  = "Guest Account (Very Limited)";
    extraGroups  = [ ];
  };
}
