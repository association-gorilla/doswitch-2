json.array!(@user_plan_allots) do |user_plan_allot|
  json.title [user_plan_allot.verb.name, "　#{set2fig(user_plan_allot.allot_h)}:#{set2fig(user_plan_allot.allot_m)}:00"]
  json.start user_plan_allot.begin_date
  # 指定した日までを含むように+1する
  json.end user_plan_allot.end_date + 1
  # json.url user_plan_allot_url(user_id: user_plan_allot.user_id, id: user_plan_allot.id)
end

# 時間を2桁にして返すメソッド
def set2fig(num)
  if num < 10
    '0' + num.to_s
  else
    num.to_s
  end
end
