{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.layout = "US";
  services.xserver.videoDrivers = [ "amdgpu-pro" ];
}
