{ config, pkgs, ... }:

{
  services.btrfs.autoScrub = { enable = true; interval = "weekly"; };
  fileSystems."/".options = [ "compress=zstd:1" "noatime" ];
  fileSystems."/home".options = [ "compress=zstd:1" "noatime" ];
}
