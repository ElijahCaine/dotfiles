#
# Location: /etc/nixos/configuration.nix
#

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # West coast best coast
  time = {
    timeZone = "America/Los_Angeles";
  };

  # Fucking steam. Why you gotta make me do this.
  nixpkgs.config.allowUnfree = true;
  hardware.opengl.driSupport32Bit = true;

  # Allllllll the packages.
  environment.systemPackages = with pkgs; [
    wget
    tmux
    i3status
    gnupg
    terminator
    dmenu
    firefox
    pass
    wicd
    i3lock
    xfce.thunar
    xfce.thunar_volman
    file
    gitAndTools.gitFull
    networkmanagerapplet
    obs-studio
    vlc
    vlc_npapi
    docker-edge
    mr
    terraform
    python3Full
    gnumake
    audacity
    gimp
    htop
    lsof
    docker_compose
    vagrant
    steam
    minikube
    python3Full
  ];

  users = {
    extraGroups = {
      # Not sure why this needs to be set manually...
      pop.gid = 1000;

      # NixOS administrator group
      nixos-admin.gid = 900;
    };

    # Define a user account. Don't forget to set a password with ‘passwd’.
    extraUsers = {
      pop = {
        name = "pop";
        group = "pop";
        extraGroups = [
          "wheel"
          "disk"
          "audio"
          "video"
          "networkmanager"
          "systemd-journal"
          "docker"
          "libvirtd"
        ];
        createHome = true;
        uid = 1000;
        home = "/home/pop";
        shell = "/run/current-system/sw/bin/bash";
      };
    };
  };


  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
    };
    virtualbox = {
      host = {
        enable = true;
      };
    };
    libvirtd = {
      enable = true;
      enableKVM = true;
    };
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system = {
    stateVersion = "17.03";
  };

  boot = {
    initrd = {
      luks = {
        devices = [
          {
            name = "root";
            device = "/dev/sda3";
            preLVM = true;
          }
        ];
      };
    };
    loader = {
      systemd-boot = {
        enable = true;
      };
      grub = {
        device = "/dev/sda";
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };

  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;
  # networking.hostName = "nixtop";

  services = {
    xserver = {
      enable = true;
      layout = "us";
      windowManager = {
        i3 = {
          enable = true;
        };
      };

      synaptics = {
        enable = true;
        twoFingerScroll = true;
      };
    };
  };
}
