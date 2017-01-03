{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "amdgpu-pro" ];
  services.xserver.displayManager.gdm.enable = true;
}
