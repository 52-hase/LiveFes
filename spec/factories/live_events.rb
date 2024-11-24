# frozen_string_literal: true

FactoryBot.define do
  factory :live_event do
    sequence(:name) { |n| "Event #{n}" }
    date { Time.current }  # 現在時刻をデフォルト値として設定
  end
end