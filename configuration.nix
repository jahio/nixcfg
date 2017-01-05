# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      ./devbox/kernel.nix
      ./devbox/hardware.nix
      ./devbox/nixos.cfg
      ./devbox/users.nix
      ./devbox/default-software.nix
      ./devbox/x11-base.nix
      ./devbox/display-manager.nix
      ./devbox/desktop-environment.nix
    ];


  # # # # # # # # # # # # #
  # 
  # CONSOLE FONTS (non-X11)
  #
  # # # # # # # # # # # # #
    fonts.enableDefaultFonts = true;
    fonts.fontconfig.enable  = true;
    fonts.enableFontDir      = true;




  # # # # # # # # # # # # #
  #
  # NETWORKING + FIREWALL
  #
  # # # # # # # # # # # # #
    # Set Hostname
    networking.hostName = "wrath";
    networking.firewall.enable = false;
    networking.firewall.allowPing = true;
    networking.firewall.pingLimit = "--limit-burst 5";
    networking.firewall.allowedTCPPortRanges = [{from = 1024; to = 65535;}];
    networking.firewall.allowedUDPPortRanges = [{from = 1024; to = 65535;}];
    networking.firewall.allowedTCPPorts = [ 139 445 ]; # samba/cifs
    networking.firewall.allowedUDPPorts = [ 139 445 ]; # samba/cifs

    # Enable samba
    services.samba.enable   = true;
    services.samba.nsswins  = true;

    # Enable mDNS (avahi)
    services.avahi.enable   = true;
    services.avahi.ipv4     = true;
    services.avahi.ipv6     = true;
    services.avahi.nssmdns  = true;

    # OpenSSH
    services.openssh.enable = true;
    programs.ssh.startAgent = true;

    # Enable tweaking the network
    networking.networkmanager.enable = true;






    # Shell Configuration
    programs.fish.enable           = true;
    programs.zsh.enable            = true;
    programs.bash.enableCompletion = true;
    programs.zsh.enableCompletion  = true;





    # Shwat version of NixOS should we be on?
    system.stateVersion = "16.09";

}
