{ config, pkgs, ... }:
{
  services.xserver.desktopManager.gnome3.enable = false;
  services.xserver.desktopManager.kde5.enable = true;
}
