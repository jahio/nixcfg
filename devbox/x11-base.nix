{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.layout = "US";
  services.xserver.videoDrivers = [ "amdgpu-pro" ];
  services.xserver.updateDbusEnvironment = true;
}
