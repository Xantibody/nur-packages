{ buildMozillaXpiAddon, fetchurl, lib, stdenv }:
  {
    "plamo-translate" = buildMozillaXpiAddon {
      pname = "plamo-translate";
      version = "0.8.0";
      addonId = "{da1a7868-5062-4eb9-a787-6d9210703929}";
      url = "https://addons.mozilla.org/firefox/downloads/file/5091555/plamo_translate-0.8.0.xpi";
      sha256 = "c3ba12654957c7a4da72215c2bbbacf9dd0e33e6c64da2d582a9c34362105cc9";
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