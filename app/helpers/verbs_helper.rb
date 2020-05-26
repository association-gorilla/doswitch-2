module VerbsHelper
  # importantのbool値で変化するHTML
  def important_change_btn(verb, important_verbs, selected_verbs)
    case verb.important
    when true
      tag.a('-優先', href: update_important_path(user_id: current_user.id, id: verb.id), class: 'btn btn-warning') if important_verbs.length > 1
    when false
      # 設定アクションであるかつ、設定アクションが1より多いなら表示する
      if verb.selected && selected_verbs.length > 1 && important_verbs.length != 2
        tag.a('+優先', href: update_important_path(user_id: current_user.id, id: verb.id), class: 'btn btn-success')
      end
    end
  end

  # selectedのbool値で変化を誘導するボタンを返す
  def selected_change_btn(verb, selected_verbs)
    case verb.selected
    when true
      # 優先アクションではないかつ、設定アクションが2つ以上なら表示
      if !verb.important && selected_verbs.length >= 2
        tag.a('-設定', href: update_selected_path(user_id: current_user.id, id: verb.id), class: 'btn btn-warning')
      end
    when false
      tag.a('+設定', href: update_selected_path(user_id: current_user.id, id: verb.id), class: 'btn btn-success')
    end
  end
end
