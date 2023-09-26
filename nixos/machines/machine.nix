{
  tree,
  pkgs,
  ...
}: {
  imports = with tree.impure.nixos.profiles; [
    gstreamer
    kernel
    php
  ];

  environment.systemPackages = with pkgs; [
    onevpl
    onevpl-intel-gpu
  ];
}
