「予約王」プロジェクトの仕様書です。

概要
----

今後は、オープンな予約システムとして公開することを目指す。

データベース設計
------------------

reservations

| カラム名        | 説明             | 型     | default | null  | features |
|-----------------|------------------|--------|---------|-------|----------|
| group           | 利用するグループ | string |         | false |          |
| username        | 利用者名         | string |         | false |          |
| tel             | 電話番号         | string |         | false |          |
| email           | メールアドレス   | string |         | false |          |
| purpose         | 利用目的         | string |         | false |          |
| payment\_method | 支払い方法       | string |         | false |          |
| remarks         | 備考             | string |         | false |          |
| use\_date       | 利用日           | date   |         | false |          |
| use\_time       | 利用時間         | string |         | false |          |

reservations_equipments

| カラム名       | 説明   | 型  | default | null  | features |
|----------------|--------|-----|---------|-------|----------|
| equipment_id   | 設備ID | int |         | false |          |
| reservation_id | 予約ID | int |         | false |          |


equipments

| カラム名 | 説明       | 型     | default | null  | features                           |
|----------|------------|--------|---------|-------|------------------------------------|
| name     | 設備名     | string |         | false |                                    |
| price    | 価格       | int    |         | false |                                    |
| type     | 課金タイプ | int    |         | false | 1: 時間単位の課金、2: 日単位の課金 |

times

| カラム名 | 説明       | 型     | default | null  | features                           |
|----------|------------|--------|---------|-------|------------------------------------|
| name     | コマ名     | string |         | false |                                    |
| price    | コマの価格 | int    |         | false |                                    |


ディレクトリ構造
----------------

インフラ側

- Document Root                       /var/vhosts/yoyaku-o.com/public
- Reverse Proxy Setting File          /etc/nginx/site-available/yoyaku-o.com
- Application Server Setting File     /etc/thin/yoyaku-prd.yml


詳細設計書
==========

予約実行
--------

### カレンダー表示

### ユーザー情報入力

### 入力情報の確認

### 予約完了

予約管理
--------

### ログイン画面

### トップ

### 予約一覧

### 管理者用カレンダー表示

### CSV出力

### 設定変更

オーナー登録 (未着手)
---------------------

### オーナー情報入力

### 登録完了画面

テストツール
============

今後の展望
==========
