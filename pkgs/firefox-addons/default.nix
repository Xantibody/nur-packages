{ buildMozillaXpiAddon, fetchurl, lib, stdenv }:
  {
    "plamo-translate" = buildMozillaXpiAddon {
      pname = "plamo-translate";
      version = "0.6.9";
      addonId = "{da1a7868-5062-4eb9-a787-6d9210703929}";
      url = "https://addons.mozilla.org/firefox/downloads/file/4957955/plamo_translate-0.6.9.xpi";
      sha256 = "b88c2e736288656e5eb81524c5763a949fc166b9dc238397b3930279387d3383";
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