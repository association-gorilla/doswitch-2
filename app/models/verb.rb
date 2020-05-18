class Verb < ApplicationRecord
  # importantステータスの変更
  def self.bool_change(verb, status:)
    if verb[status]
      verb.update(status => false)
    else
      verb.update(status => true)
    end
  end
end
