class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  protected

  # サインアップ後にユーザーごとのデフォルト行動レコードを作成する
  def after_sign_up_path_for(_resource)
    if Verb.find_by(user_id: current_user.id).nil?
      Verb.create!(user_id: current_user.id, name: '学習', selected: true, important: true)
      Verb.create!(user_id: current_user.id, name: '休憩', selected: true, important: false)
      Verb.create!(user_id: current_user.id, name: 'その他', selected: true, important: false)
    end
    root_path
  end
end
