# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  
  services.xserver.videoDrivers = ["amdgpu-pro" ];
  # boot.kernelModules = [ "amdgpu-pro" ];



  # # # # # # #
  #
  # SYSCTL BOOT
  #
   boot.kernel.sysctl = {
     "net.ipv6.conf.all.use_tempaddr" = 2; # privacy
     "net.core.somaxconn"             = 1024;
     "net.ipv4.ip_local_port_range"   = "1024 65535";
     "vm.swappiness"                  = 25;
   };

   # Set time zone
   time.timeZone = "America/Chicago";


   # Enable specific hardware
   hardware.bluetooth.enable = true;
   hardware.pulseaudio.enable = true;
   hardware.pulseaudio.package = pkgs.pulseaudioFull;
   sound.enable = true;
   sound.enableMediaKeys = true;

   # Allow "non-free" packages && use dri for 32-bit stuffs
   nixpkgs.config.allowUnfree = true;
   hardware.opengl.driSupport32Bit = true;






  # # # # # # # # # # # # #
  # 
  # CONSOLE FONTS (non-X11)
  #
  # # # # # # # # # # # # #
    fonts.enableDefaultFonts = true;
    fonts.fontconfig.enable  = true;
    fonts.enableFontDir      = true;
    i18n = {
      consoleFont = "Lat2-Terminus16";
      consoleKeyMap = "us";
      defaultLocale = "en_US.UTF-8";
    };


  # Turn on gpm, which gives you a nice mouse cursor in console
    services.gpm.enable = true;




  # # # # # # # # # # # # #
  #
  # USER CONFIGURATION
  #
  # # # # # # # # # # # # #
    users.extraUsers.jah = {
      isNormalUser = true;
      home = "/home/jah";
      description = "THE MAN. THE LEGEND.";
      extraGroups = [ "networkManager" "wheel" ];
      uid = 1000;
    };

    users.extraUsers.guest = {
      isNormalUser = true;
      home = "/home/guest";
      description = "Guest Account.";
      extraGroups = [ ];
    };




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







  # # # # # # # # # # # # # # #
  #
  # GLOBALLY INSTALLED SOFTWARE
  #
  # # # # # # # # # # # # # # #
    environment.systemPackages = with pkgs; [
      # Utilities
      wget tmux git curl traceroute mtr nethogs ncdu iftop
      iotop dstat openssl lsof htop xclip acpi pciutils file
      gnupg links2 gptfdisk gnufdisk mosh stdenv autoconf
      which automake glib pkgconfig beep
      
      # Editors, Browsers
      vim neovim chromium firefox nano
    ];

    # Tweaks for Chromium
    nixpkgs.config.chromium = {
      hiDPISupport      = true;
      enableWideVine    = true;
      enablePepperFlash = false; # get that from branded *chrome* instead
    };


   
    # Shell Configuration
    programs.fish.enable           = true;
    programs.zsh.enable            = true;
    programs.bash.enableCompletion = true;
    programs.zsh.enableCompletion  = true;





  # # # # # # # # # # # # # # # # # # #
  #
  # GRAPHICAL USER INTERFACE / X11
  # 
  # # # # # # # # # # # # # # # # # # #
    services.xserver.enable = true;
    services.xserver.layout = "us";
    services.xserver.displayManager.gdm.enable        = true;
    services.xserver.displayManager.slim.enable       = false;
    services.xserver.displayManager.lightdm.enable    = false;
    services.xserver.displayManager.kdm.enable        = false;
    services.xserver.displayManager.sddm.enable       = false;


    services.xserver.desktopManager.gnome3.enable     = true;
    services.xserver.desktopManager.kde5.enable       = false;
    services.xserver.desktopManager.kde4.enable       = false;
  
    # Shwat version of NixOS should we be on?
    system.stateVersion = "16.09";

}
