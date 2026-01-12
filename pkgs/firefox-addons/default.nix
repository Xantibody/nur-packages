{
  fetchurl,
  lib,
  stdenv,
}:

let
  buildFirefoxXpiAddon =
    {
      pname,
      version,
      addonId,
      url,
      sha256,
    }:
    stdenv.mkDerivation {
      inherit pname version;

      src = fetchurl { inherit url sha256; };

      preferLocalBuild = true;
      allowSubstitutes = true;

      buildCommand = ''
        dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
        mkdir -p "$dst"
        install -v -m644 "$src" "$dst/${addonId}.xpi"
      '';
    };
in
{
  "plamo-translate" = buildFirefoxXpiAddon {
    pname = "plamo-translate";
    version = "0.3.2";
    addonId = "{da1a7868-5062-4eb9-a787-6d9210703929}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4631720/plamo_translate-0.3.2.xpi";
    sha256 = "sha256-QPxmsLVZc4USvDPEdAl2vgVXZzHQwTsaNA1ZzgwdK8c=";
  };
}
