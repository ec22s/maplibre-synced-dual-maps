### デモ動画作成
1. キャプチャ動画を準備

1. FFmpegで適当なサイズのMP4にする
    ```sh
    ffmpeg -i {SOURCE} -vf scale=1080:-1 {OUTPUT}.mp4
    ```

1. リポジトリのQRコード準備
    - 今回利用 : [QRのススメ](https://qr.quel.jp/design.php)
      - アイコンをGitHubに
      - 画像サイズ = 5 (245 x 245 px)
      - 背景を透過に
      - PNGで保存

1. MP4とPNGを合体して完成
    ```sh
    ffmpeg -i {OUTPUT-1}.mp4 -i repository-QR.png -filter_complex overlay=810:810 {OUTPUT-2}.mp4

    # overlayは左上からの位置
    ```
