# frozen_string_literal: true

# FactoryBotでのファクトリ定義、テスト用のオブジェクト生成を簡単にする
FactoryBot.define do
  factory :live_event do # live_eventという名前のファクトリを定義

    # sequenceメソッドで一意の値を自動生成
    # 連番で名前を生成（Event 1, Event 2, Event 3...）
    # nは連番のインデックス
    sequence(:name) { |n| "Test Live Event #{n}" }
    date { Time.current }  # 現在時刻をデフォルト値として設定
  end
end