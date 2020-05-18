module VerbsHelper
  # importantのbool値で変化するHTML
  def important_change_btn(verb)
    case verb.important
    when true
      tag.a('-優先', href: update_important_path(user_id: current_user.id, id: verb.id), class: 'btn btn-warning')
    when false
      # ストックアクションにあるときはまず設定アクションへの変更を誘導
      tag.a('+優先', href: update_important_path(user_id: current_user.id, id: verb.id), class: 'btn btn-success') if verb.selected
    end
  end

  # selectedのbool値で変化を誘導するボタンを返す
  def selected_change_btn(verb)
    case verb.selected
    when true
      # 優先アクションにあるときはまず設定アクションへの変更を誘導
      tag.a('-設定', href: update_selected_path(user_id: current_user.id, id: verb.id), class: 'btn btn-warning') unless verb.important
    when false
      tag.a('+設定', href: update_selected_path(user_id: current_user.id, id: verb.id), class: 'btn btn-success')
    end
  end
end
