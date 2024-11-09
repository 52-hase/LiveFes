source "https://rubygems.org"

ruby "3.2.3"
gem "rails", "~> 7.1.3", ">= 7.1.3.3"
gem "sprockets-rails"
gem "pg", "~> 1.2"
gem "puma", ">= 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "rspec-rails"
end

# 承認機能
gem "devise"
# メールのプレビューをWeb上で確認する
gem "letter_opener_web", "~> 3.0"
# 環境変数.envを使うため
gem "dotenv-rails"
# bootstrapの使用
gem "bootstrap", "~> 5.3.3"
# 画像処理を行うため
gem "image_processing", "~> 1.2"
# AWS S3との連携を行うため
gem "aws-sdk-s3"
# GoogleのOAuth2認証を行うため
gem "omniauth-google-oauth2"
# OmniauthのCSRF保護を追加するため
gem "omniauth-rails_csrf_protection"
# SEO対策のためにメタタグを管理するため
gem "meta-tags"
# SpotifyのAPIと連携するため
gem "rspotify"
# 開発環境でのコードスタイルチェックを行うため
gem "rubocop-rails-omakase", require: false, group: [ :development ]
# セキュリティ診断を行うため
gem "brakeman", "~> 6.2.2"
