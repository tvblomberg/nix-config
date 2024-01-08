{ inputs, pkgs ? import <nixpkgs> {  } }:

pkgs.mkShell
{
  nativeBuildInputs = [
    pkgs.zlib
    pkgs.libtool
    pkgs.autoconf-archive
    pkgs.autoconf
    pkgs.automake
    pkgs.pkg-config
    pkgs.nasm
    pkgs.powershell
    #pkgs.jetbrains.rider

    inputs.dotnet5.legacyPackages."x86_64-linux".dotnet-sdk_5
    inputs.node14-15-1.legacyPackages."x86_64-linux".nodejs-14_x
  ];

  shellHook = ''
			LD=$CC
      curl -fsSL https://aka.ms/install-artifacts-credprovider.sh | USE_NET6_ARTIFACTS_CREDENTIAL_PROVIDER=false bash
	'';
}
