#***ENG*****************************************************************#
# Do not modify this file!  It was generated by ‘nixos-generate-config’ #
# and may be overwritten by future invocations.  Please make changes    #
# to /etc/nixos/configuration.nix instead.                              #
#***RUS*****************************************************************#
# Не изменяйте этот файл! Он был сгенерирован «nixos-generate-config»   #
# и может быть перезаписан при будущих вызовах. Вместо этого внесите    #
# изменения в /etc/nixos/configuration.nix.                             #
#***********************************************************************#

{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "ehci_pci" "ahci" "usb_storage" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/e5bede59-e1af-43a8-aeeb-63a1ab410735";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/D89A-4211";
      fsType = "vfat";
    };

  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 6*1024;
  } ];


  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  #
  # Включает DHCP на каждом Ethernet и беспроводном интерфейсе. В случае сети со сценариями 
  # (по умолчанию) это рекомендуемый подход. При использовании systemd-networkd по-прежнему 
  # можно использовать эту опцию, но рекомендуется использовать ее в сочетании с явными 
  # объявлениями для каждого интерфейса с `networking.interfaces.<interface>.useDHCP`.
  # -------------------------------------------------------------------------------------------
    networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.ens5.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
