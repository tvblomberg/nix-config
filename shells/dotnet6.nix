{ inputs, pkgs ? import <nixpkgs> {} }:

pkgs.mkShell
{
  nativeBuildInputs = with pkgs; [
    dotnet-sdk_6
  ];
}
