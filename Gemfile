# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'
gem 'bootsnap', '>= 1.1.0', require: false
# BootstrapでSassを使うgem
gem 'bootstrap', '4.0.0'
gem 'jbuilder', '~> 2.5'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.4', '>= 5.2.4.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# 論理削除するためのgem
gem 'paranoia'
# 画像ファイルをアップロード
gem 'refile', require: 'refile/rails', github: 'manfe/refile'
# 画像のリサイズ機能
gem 'refile-mini_magick'
gem 'devise'
gem 'faker'
gem 'jquery-rails'
# Railsで定時処理をするためのgem
gem 'whenever', require: false
# JavaScriptのランタイムを用意
# gem 'therubyracer', platforms: :ruby
gem 'mini_racer', '~> 0.2.4'
gem 'chartkick'
# カレンダー表示するためのgem
gem 'fullcalendar-rails'
gem 'momentjs-rails'
# サクセスメッセージ、エラーメッセージにアニメーションをつけるgem
gem 'toastr-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # binding.pryを挿入して、処理の経緯を把握できる
  gem 'pry-rails'
  gem 'sqlite3'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  # 生Rubyに関わる構文規則チェック
  gem 'rubocop', require: false
  # Railsに関わる構文規則チェック
  gem 'rubocop-rails'
  # パフォーマンスに関わる構文規則チェック
  gem 'rubocop-performance'
  # コミット時に自動でrubocopを動作してくれる
  gem 'pre-commit', require: false
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# PostgreSQLデータベースを使用するためのgem
group :production do
  gem 'pg', '~> 0.20.0', require: false
end
