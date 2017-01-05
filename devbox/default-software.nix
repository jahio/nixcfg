{
  environment.systemPackages = [
   pkgs.git
   pkgs.vim
   pkgs.neovim
   pkgs.tmux
   pkgs.wget
   pkgs.curl
   pkgs.traceroute
   pkgs.mtr
   pkgs.nethog 
   pkgs.ncdu
   pkgs.iftop
   pkgs.iotop
   pkgs.dstat
   pkgs.openssl
   pkgs.openssh
   pkgs.lsof
   pkgs.htop
   pkgs.xclip
   pkgs.gnupg
   pkgs.links2
   pkgs.gptfdisk
   pkgs.gnufdisk
   pkgs.mosh
   pkgs.stdenv
   pkgs.autoconf
   pkgs.which
   pkgs.beep
   pkgs.chromium
   pkgs.firefox
  ];

  # Special configuration for Chromium
  nixpkgs.config.chromium = {

    # Allow higher DPI support in case of 4k monitors, etc.
    hiDPISupport = true;

    # Widevine Content Decryption Module - for watching
    # Netflix, Amazon Video, etc.
    enableWideVine = true;

    # Turn flash off for global Chromium installation;
    # each user will have to enable it or turn it on
    # for themselves to prevent any possible system-wide
    # security breach through this particular vector.
    enablePepperFlash = false;
  };

}
