{ config, pkgs, ... }:
{
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "US";
    defaultLocale = "en_US.UTF-8";
  };

  # Sure, let's just shoe-horn this in here...
  services.gpm.enable = true;

}
