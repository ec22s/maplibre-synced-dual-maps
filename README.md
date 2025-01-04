# MapLibre Native Synced Dual Maps

- Inspired from [Mapbox GL Synced Dual Maps](https://gist.github.com/boeric/f6ddea14600dc5093506).

- 地図データやスタイルの比較検証を簡単にしたくて作りました

- Todo: ここにデモ動画挿入

<br>

### 動作検証環境
- Xcode 16.2

- 実機 : iPad 10th generation (OS 18.2)

- シミュレータ : 同上

<br>

### 使用ライブラリ
- Swift Package Managerで設定済みですが、自動でインストールされない時は `MapLibre Native` 6.9.0以降を追加して下さい

- 他の使用ライブラリはありません

<br>

### 動作と制約

- 中央の拡大/縮小ボタンに全ての地図が追従します

- 一つの地図で拡大/縮小/移動すると他の地図が追従します

  - 拡大/縮小/移動が完了したタイミングで追従するため若干タイムラグがあります

- 回転とチルトは今回対象外とし、地図自体で無効化しました

- 端末の縦/横の向きに地図の並びが連動します

<br>

### デフォルトの地図スタイル

- MapLibreドキュメントの[Styles in Examples](https://maplibre.org/maplibre-native/ios/latest/documentation/maplibre-native-for-ios/examplestyles/)にある二つです

<br>

### カスタマイズ

- 下記を変更することで可能です

  Todo: ここにConstatns.swiftを貼る

- 地図スタイルが三つ以上の場合は未検証です

  - 問題があればIssue報告してもらえると助かります🙇‍♂️

<br>



