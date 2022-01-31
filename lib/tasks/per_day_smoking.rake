namespace :registration_smokings
  desc '1日の喫煙本数を登録する'
  task save_number_of_smokings: :environment do
    today_smokings = Smoking.where(created_at: Date.today.all_day)
    users = User.all
    users.each do |user|
      today_smokings =  Smoking.where(created_at: Date.today.all_day, user_id: user.id).count
      PerDaySmoking.create(user_id: user.id, number_of_smoking: today_smokings, smoked_on: Date.today)
  end