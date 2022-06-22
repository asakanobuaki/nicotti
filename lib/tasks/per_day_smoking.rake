namespace :registration_smokings do
  desc '1日の喫煙本数を登録する'
  task save_number_of_smokings: :environment do
    User.find_each do |user|
      PerDaySmoking.create!(user_id: user.id, number_of_smoking: user.today_smokings_count, smoked_on: Time.zone.today)
    end

    p 'ここまでOK'
  end
end
