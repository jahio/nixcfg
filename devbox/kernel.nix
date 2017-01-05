{ config, pkgs, ... }:
{
  boot.kernel.sysctl = {
    "net.core.somaxconn" = 1024;
    "vm.swappiness"      = 25;   
  };
   

  time.timeZone = "America/Chicago";
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
