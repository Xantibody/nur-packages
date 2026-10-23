{ buildMozillaXpiAddon, fetchurl, lib, stdenv }:
  {
    "plamo-translate" = buildMozillaXpiAddon {
      pname = "plamo-translate";
      version = "0.8.3";
      addonId = "{da1a7868-5062-4eb9-a787-6d9210703929}";
      url = "https://addons.mozilla.org/firefox/downloads/file/5156826/plamo_translate-0.8.3.xpi";
      sha256 = "77a5e66317611f33cabde1a5c80d0456944694af9ec79da655d4ab025eb289a8";
      meta = with lib;
      {
        homepage = "https://translate.preferredai.jp";
        description = "国産AI「PLaMo翻訳」で、Webページをレイアウトそのまま高品質に翻訳。ワンクリックで簡単に実行。無料で始められます。";
        mozPermissions = [
          "storage"
          "activeTab"
          "tabs"
          "identity"
          "contextMenus"
          "webNavigation"
          "<all_urls>"
          "https://translate.preferredai.jp/browser/callback*"
        ];
        platforms = platforms.all;
      };
    };
  }