
desc "1日の喫煙数を登録する"
task save_number_of_smokings: :environment do
  User.find_each do |user|
    yesterday_smokings =  user.yesterday_smokings_count
    user.per_day_smokings.create!(number_of_smoking: yesterday_smokings, smoked_on: Date.yesterday)
  end
end

desc 'バディに昨日の喫煙本数をLINEで送信'
task push_message_to_buddy: :environment do

  client ||= Line::Bot::Client.new { |config|
    config.channel_id = ENV["LINE_CHANNEL_ID"]
    config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
    config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
  }

  User.find_each do |user|
    user_ids = user.buddies.pluck(:line_id)
    message = user.set_bubble
    client.multicast(user_ids, message)
  end

  p '送信完了'
end
