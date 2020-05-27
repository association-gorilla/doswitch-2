class AchieveRecord < ApplicationRecord
  belongs_to :user

  def self.only_oneday_records(active_records)
    record_days = []
    active_records.each do |active_record|
      record_days << active_record.created_at.strftime('%F')
    end
    record_days.uniq
  end

  def self.allot_distribution(active_records)
    # グラフ生成用の配列作成
    graph_array = []
    active_records.each do |active_record|
      graph_array << [active_record.verb_name, (active_record.allot / 86_400.0 * 100).floor(3)]
    end
    # 最後にそれ以外をグラフの要素として入れる
    leftover = ((86_400 - active_records.map(&:allot).inject(:+)) / 86_400.0 * 100).floor(3)
    graph_array << ['それ以外', leftover]
    graph_array
  end
end
