<?php require __DIR__ . '/include/functions.php'; ?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Roundcube 新版本說明手冊</title>
  <link rel="shortcut icon" href="<?= assetVersioned('../elastic/images/favicon.ico'); ?>">
  <link rel="stylesheet" href="<?= assetVersioned('../elastic/fonts/noto_sans_tc_regular/css.css'); ?>">
  <link rel="stylesheet" href="<?= assetVersioned('../elastic/fonts/noto_sans_sc_regular/css.css'); ?>">
  <link rel="stylesheet" href="<?= assetVersioned('assets/styles/index.css'); ?>">
</head>
<body>
  <h1 id="change-skin">如何更換使用者介面</h1>
  <p>
    如果不習慣使用新版本的預設介面（Elastic），可以依照下圖更換回舊版本的預設介面。
    但 Elastic 介面在行動裝置上有比較好的表現。
    <br>
    <br>
    <img src="<?= assetVersioned('assets/images/change-skin.png'); ?>">
  </p>

  <h1 id="change-mail-list-layout">不想要直接預覽郵件</h1>
  <p>
    以下用 Larry 介面為例，將「畫面配置」修改為「清單」即無預覽郵件的功能。
    Classic 介面的更換方式與此雷同； Elastic 介面目前無法調整。
    <br>
    <br>
    <img src="<?= assetVersioned('assets/images/change-mail-list-layout.png'); ?>">
  </p>

  <h1 id="add-to-screen-desktop">將網站加到行動裝置的主畫面</h1>
  <p>
    以下以 Google Chrome Mobile 為例。
    <br>
    <br>
    <img src="<?= assetVersioned('assets/images/add-to-screen-desktop.png'); ?>">
  </p>
</body>
</html>
