{
  self,
  lib,
  stdenv,
  cmake,
  pkg-config,
  gtest,
  libdrm,
  libffi,
  libpciaccess,
  libva,
  libX11,
  libXau,
  libXdmcp,
  wayland,
  wayland-protocols,
  ...
}:
stdenv.mkDerivation rec {
  pname = "onevpl";
  version = "custom";
  src = self.inputs.onevpl;

  nativeBuildInputs = [cmake pkg-config];
  buildInputs = [
    libdrm
    libffi
    libpciaccess
    libva
    libX11
    libXau
    libXdmcp
    wayland
    wayland-protocols
  ];
  nativeCheckInputs = [gtest];

  cmakeFlags = [
    "-DBUILD_TESTS=${
      if doCheck
      then "ON"
      else "OFF"
    }"
    "-DUSE_SYSTEM_GTEST=ON"
    "-DINSTALL_EXAMPLE_CODE=OFF"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Intel oneVPL GPU Runtime";
    license = licenses.mit;
    platforms = ["x86_64-linux"];
  };
}
