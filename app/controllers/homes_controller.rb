class HomesController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  def top
    @important_verb = Verb.find_by(user_id: current_user.id, important: true)
    @selected_verbs = Verb.where(user_id: current_user.id, selected: true, important: false)
  end

  def about; end
end
