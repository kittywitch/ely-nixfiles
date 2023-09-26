{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    php.withExtensions
    ({
      enabled,
      all,
    }:
      with all; [
        imagick
        opcache
      ])
  ];
}
