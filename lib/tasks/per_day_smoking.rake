namespace :registration_smokings do
  desc '1日の喫煙本数を登録する'
  task save_number_of_smokings: :environment do

    logger = Logger.new 'log/cron.log'

    User.find_each do |user|
      today_smokings =  Smoking.where(created_at: Date.today.all_day, user_id: user.id).count
      PerDaySmoking.create!(user_id: user.id, number_of_smoking: today_smokings, smoked_on: Date.today)
    end

    p "ここまでOK"

  end
end
