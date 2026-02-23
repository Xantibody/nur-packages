{ buildFirefoxXpiAddon, fetchurl, lib, stdenv }:
  {
    "plamo-translate" = buildFirefoxXpiAddon {
      pname = "plamo-translate";
      version = "0.3.11";
      addonId = "{da1a7868-5062-4eb9-a787-6d9210703929}";
      url = "https://addons.mozilla.org/firefox/downloads/file/4662921/plamo_translate-0.3.11.xpi";
      sha256 = "a4884d5d7f53a03e2b3b7fd583ba90fdfb0dd426abb6a97e057dc7870ebae97d";
      meta = with lib;
      {
        homepage = "https://translate.preferredai.jp";
        description = "A Firefox extension for translating web pages by PLaMo Translate Model.";
        mozPermissions = [
          "storage"
          "activeTab"
          "tabs"
          "identity"
          "contextMenus"
          "webNavigation"
          "<all_urls>"
          "https://app.translate.preferredai.jp/browser/callback*"
        ];
        platforms = platforms.all;
      };
    };
  }