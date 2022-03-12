
desc "1日の喫煙数を登録する"
task save_number_of_smokings: :environment do
  User.find_each do |user|
    today_smokings =  Smoking.where(created_at: Date.today.all_day, user_id: user.id).count
    PerDaySmoking.create!(user_id: user.id, number_of_smoking: today_smokings, smoked_on: Date.today)
  end

end