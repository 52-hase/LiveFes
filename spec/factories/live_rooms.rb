# frozen_string_literal: true

FactoryBot.define do
  factory :live_room do
    name { "Test Live Room" } # 必要に応じてデフォルト値を設定
    association :user # 必要であれば関連付けを設定
  end
end
