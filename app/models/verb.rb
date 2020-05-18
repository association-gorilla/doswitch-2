class Verb < ApplicationRecord
  # importantステータスの変更
  def self.bool_change(verb, status:)
    if verb[status]
      verb.update(status => false)
    else
      verb.update(status => true)
    end
  end

  def self.important_number_check(verb, important_verbs)
    # 優先アクションから外す時なら優先アクションが2つなら実行
    if verb.important && important_verbs.length == 2
      true
    # 優先アクションを追加する時に優先アクションが2つ未満なら実行
    elsif !verb.important && important_verbs.length < 2
      true
    else
      false
    end
  end

  # 現在の設定中アクションの数が２つ以上５つ以下になるようにbool値を返す
  def self.selected_number_check(verb, selected_verbs)
    # 設定アクションから外す時に設定アクションが2つより大きいなら実行
    if verb.selected && selected_verbs.length > 2
      true
    # 設定アクションを追加する時に設定アクションが1より多く5未満なら実行
    elsif !verb.selected && selected_verbs.length < 5
      true
    else
      false
    end
  end
end
