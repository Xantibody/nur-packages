# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{
  pkgs ? import <nixpkgs> { },
}:

{
  # The `lib`, `modules`, and `overlays` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays
  firefox-addons = pkgs.lib.recurseIntoAttrs (
    pkgs.callPackage ./pkgs/firefox-addons {
      buildFirefoxXpiAddon = pkgs.lib.makeOverridable ({ pname, version, addonId, url, sha256, meta, ... }:
        pkgs.stdenv.mkDerivation {
          name = "${pname}-${version}";
          inherit meta;
          src = pkgs.fetchurl { inherit url sha256; };
          preferLocalBuild = true;
          allowSubstitutes = true;
          passthru = { inherit addonId; };
          buildCommand = ''
            dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
            mkdir -p "$dst"
            install -v -m644 "$src" "$dst/${addonId}.xpi"
          '';
        }
      );
    }
  );
  # some-qt5-package = pkgs.libsForQt5.callPackage ./pkgs/some-qt5-package { };
  # ...
}
