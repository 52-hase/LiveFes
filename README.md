# Live Fes
[![Image from Gyazo](https://i.gyazo.com/e94c1bebfa0680067260947ddb44a6c1.png)](https://gyazo.com/e94c1bebfa0680067260947ddb44a6c1)
<br><br>
<br><br>


## ◽️サービスURL
https://www.live-fes.com
<br><br>
<br><br>


## ◽️サービス概要
Live Fes は音楽ライブ・フェスの参加者が感想や思い出を発信し合うことで、余韻に浸ったり、喪失感を緩和させたりする場を提供するサービスです。
<br><br>
<br><br>


## ◽️このサービスへの思い・作りたい理由
私は音楽ライブ・フェスが趣味で、年に10回ほど参加します。イベントの後には必ず、「X」でトレンドに上がるほどの感想が参加者から発信されます。こうした参加者のイベントに対する余韻は1〜2週間ほど続くと聞きました。（私自身も余韻は一週間ほど残り、ライブで聴いた曲をもう一度聴きます） また、イベント終了後には、ライブの盛り上がりから解放され、現実に引き戻されることにより「悲しい」「寂しい」といった喪失感に襲われます。 このような「余韻」や「喪失感」を共有できる場があれば、参加した者同士で、より楽しく余韻に浸ったり、寂しい気持ちを共感し合い、喪失感を分かち合うことができると考えました。
<br><br>
<br><br>



## ◽️サービスの利用イメージ
音楽フェスやライブ終了後の控室のような感覚で利用できます。チャット欄の閲覧のみログイン不要で、チャットルームはユーザーが自由に作成可能です。また、曲の再生機能を使ってライブに参加したアーティストの曲を聴くことができます。「ここが良かった！」「あの曲が聴けて良かった！」といった感想を共有することで余韻に浸り、「ライブが終わって寂しい」「また次も参加しましょう！」といった気持ちを分かち合い、喪失感を和らげることが目的です。
<br><br>
<br><br>


## ◽️機能紹介
| ログイン | ユーザー登録 |
| :---: | :---: |
|  [![Image from Gyazo](https://i.gyazo.com/afe419b4129d5473cc5b402b2b2b819b.png)](https://gyazo.com/afe419b4129d5473cc5b402b2b2b819b)| <img src="https://i.gyazo.com/1ed6ce7cf8d3dc67722d0aa532dcbc55.gif" width="400"> |
| <p align="left">『メールアドレス』『パスワード』を入力してログインすることができます。<br>　また、Googleアカウントを用いてGoogleログインを行う事も可能です。</p> | <p align="left">　『名前』『メールアドレス』『パスワード』『確認用パスワード』を<br>入力してユーザー登録を行います。ユーザー登録後は、自動的に<br>ログイン処理が行われ、直ぐにサービスを利用する事が出来ます。<br>　また、Googleアカウントを用いてGoogleログインを行う事も可能です。</p> |

| ライブルームの作成（チャットルーム） |全体画像|
| :---: | :---: |
|<img src="https://i.gyazo.com/b93afe3f67e705367315bf16c5e4d7dd.gif" width="450">|[![Image from Gyazo](https://i.gyazo.com/7308c26d537dc9efa75827135ca9001f.jpg)](https://gyazo.com/7308c26d537dc9efa75827135ca9001f)|
| <p align="left">　ルーム名を入力して、ライブルームの作成を行います。<br>ライブルーム作成後は、自動的にルームに遷移される様に<br>なっています。</p> | <p align="left">・メッセージ入力フォームは画面下部に固定されています。<br>・メッセージの送信、画像の送信が可能です。<br>・"Xでライブをシェアする"からライブルームに遷移できるポストができます。</p> |

<br><br>
<br><br>


## ◽️サービスの差別化ポイント・推しポイント
- 「X」がサービスとしては類似しているが、Xは規模が大きすぎる。規模を小さくし目的を音楽ライブ、フェスの感想共有に絞ることで、差別化を図ります。
- 「X」では２日ほどはトレンドに上がりますが、早ければその日のうちに他の話題にかき消されてしまいます。トレンドから外れた後は、目的のポストを探すのに「文言」や「＃」で検索する必要があるが、このサービスではライブごとの部屋を作ることで同じ目的意識の人達が集まることができます。
- ライブに参加したアーティストのセットリスト表示します。（表示された曲はSpotify APIで曲を再生できるようにする）
<br><br>
<br><br>


## ◽️技術スタック
| カテゴリー     | 技術スタック             |
| ------------| --------------------- |
| 開発環境      | Docker                |
| フロントエンド   |   JavaScript, Bootstrap          |
| バックエンド    | Ruby ver3.2.2, Ruby on Rails ver7.1.3, Node.js, WebSocket (ActionCable)  |
| データベース   | PostgreSQL                             |
| インフラ       |  Heroku, AWS S3                        |
| Web API     |   Spotify Web API（gem 'rspotify'）      |
| Gem         |  devise, letter_opener_web ~> 3.0, dotenv-rails,　image_processing ~> 1.2, aws-sdk-s3, omniauth-google-oauth2, omniauth-rails_csrf_protection, meta-tags, rspotify   |



## ◽️画面遷移図
画面遷移図は[こちら](https://www.figma.com/board/OKJCxoKYBoldymLsJ65ihR/Untitled?node-id=0%3A1&t=LVJsXm6GHN7W2qk2-1)です（企画段階）
<br><br>
<br><br>


## ◽️ER 図
[![Image from Gyazo](https://i.gyazo.com/6b285f81daf9b8100bdb8198284de113.png)](https://gyazo.com/6b285f81daf9b8100bdb8198284de113)
