{ config, pkgs, ... }:
{
    services.xserver.displayManager.sddm.enable = true;
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.displayManager.slim.enable = true;
  # services.xserver.displayManager.kdm.enable = true;
}
