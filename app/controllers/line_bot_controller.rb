class LineBotController < ApplicationController
  protect_from_forgery except: [:callback]
  skip_before_action :require_login, only: [:callback]

  def callback

    # StringIOクラスをreadメソッドで文字列に変換
    body = request.body.read

    # 署名の検証
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    return head :bad_request unless client.validate_signature(body, signature)

    events = client.parse_events_from(body)

    events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          case event.message['text']
          when 'バディ申請'
            message = reply_text('【バディ招待コード】を送信してください')
        
          when /\AbID\w{8}/
            @buddy = Buddy.find_by(line_id: event['source']['userId']) 
            @buddy = Buddy.create!(line_id: event['source']['userId']) unless @buddy
            @user = User.find_by(invite_code: event.message['text'])
            @buddy_user = BuddyUser.find_by(user_id: @user.id, buddy_id: @buddy.id)

            if @user.present?
              if @buddy_user.blank?
                BuddyUser.create!(user_id: @user.id, buddy_id: @buddy.id)
                message = reply_text("【#{@user.name}】さんのバディに登録されました。")
              else
                message = reply_text("【#{@user.name}】さんはバディ登録済みです。")
              end
            else
              message = reply_text("ユーザーが確認できません。コードを確認して再度送信してください。")
            end
            
          else
            message = reply_text('申し訳ございません。任意の文字は読み取ることができません。')
          end
          client.reply_message(event['replyToken'], message)
        end
      end
      head :ok
    end

  end

  private

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_id = ENV["LINE_CHANNEL_ID"]
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end 

  def reply_text(text)
    {type: 'text', text: text}
  end
end
