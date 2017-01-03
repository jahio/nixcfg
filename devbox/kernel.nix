{ config, pkgs, ... }:
{
  boot.kernel.sysctl = {
    "net.core.somaxconn" = 1024;
    "vm.swappiness"      = 25;   
  };
   

  time.timeZone = "America/Chicago";
  boot.kernelModules = [ "amdgpu-pro" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
 
  sound.enable = true;
  sound.enableMediaKeys = true;
  hardware.bluetooth.enable = true;
  hardware.opengl.driSupport32Bit = true; 

}
