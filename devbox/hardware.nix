{ config, pkgs, ... }:
{
  hardware.bluetooth.enable          = true;
  hardware.pulseaudio.enable         = true;
  hardware.pulseaudio.package        = pkgs.pulseaudioFull;
  
  sound.enable                       = true;
  sound.enableMediaKeys              = true;

  hardware.opengl.driSupport         = true;
  hardware.opengl.driSupport32Bit    = true;
}
