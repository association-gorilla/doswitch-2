# 定期的に実行したいバッチ処理をこちらに記述
set :output, File.join(Whenever.path, "log", "cron.log")
# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env
env :PATH, ENV['PATH']
job_type :rbenv_rake, %q!eval "$(rbenv init -)"; cd :path && :environment_variable=:environment bundle exec rake :task --silent :output!

every 1.day, :at => '13:58 pm' do
  rake "action_restart:day_beyond_restart"
end
