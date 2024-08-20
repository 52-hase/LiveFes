class Contact < ApplicationRecord
  validates :name, presence: { message: "名前を入力してください" }
  validates :email, presence: { message: "メールアドレスを入力してください" }
  validates :message, presence: { message: "お問い合わせ内容を入力してください" }, length: { maximum: 150, message: "お問い合わせ内容は150文字以内で入力してください" }
end
