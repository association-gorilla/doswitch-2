json.array!(@user_plan_allots) do |user_plan_allot|
  json.title user_plan_allot.verb.name
  json.start user_plan_allot.begin_date
  # 指定した日までを含むように+1する
  json.end user_plan_allot.end_date + 1
  # json.url user_plan_allot_url(user_id: user_plan_allot.user_id, id: user_plan_allot.id)
end
