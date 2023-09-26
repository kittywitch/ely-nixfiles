{
  lib,
  stdenv,
  cmake,
  pkg-config,
  gtest,
  libdrm,
  libva,
  self,
}:
stdenv.mkDerivation rec {
  pname = "onevpl-intel-gpu";
  version = "custom";
  src = self.inputs.onevpl-intel-gpu;

  nativeBuildInputs = [cmake pkg-config];
  buildInputs = [
    libdrm
    libva
  ];
  nativeCheckInputs = [gtest];

  cmakeFlags = [
    "-DBUILD_TESTS=${
      if doCheck
      then "ON"
      else "OFF"
    }"
    "-DUSE_SYSTEM_GTEST=ON"
  ];

  doCheck = true;

  meta = with lib; {
    description = "Intel oneVPL GPU Runtime";
    license = licenses.mit;
    platforms = ["x86_64-linux"];
  };
}
