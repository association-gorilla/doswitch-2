class ActionsController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!
end
