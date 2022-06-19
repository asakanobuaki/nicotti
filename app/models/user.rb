class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :smokings, dependent: :destroy
  has_many :per_day_smokings, dependent: :destroy
  has_many :buddy_users, dependent: :destroy
  has_many :buddies, through: :buddy_users

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true, presence: true
  validates :excess_cigarette, presence: true
  validates :target_number, presence: true
  validates :state, presence: true
  validates :life, presence: true
  validates :role, presence: true
  validates :invite_code, uniqueness: true, presence: true

  enum state: { healthy: 0, baldness: 1, cancer: 2 }
  enum role: { general: 0, admin: 10, guest: 20 }

  def remaining_number
    target_number - today_smokings_count
  end

  def today_smokings_count
    smokings.where(created_at: Date.today.all_day).count
  end

  def yesterday_smokings_count
    smokings.where(created_at: Date.yesterday.all_day).count
  end

  def monthly_smokings_count
    smokings.where(created_at: Date.yesterday.all_month).count
  end

  # 1日の目標喫煙本数を超過している場合、超過本数が１プラスされる。
  def target_over
    if today_smokings_count > target_number
      self.excess_cigarette += 1
    end
  end

    # 超過喫煙本数に応じてステータスを変更
  def user_state
    case excess_cigarette
    when 6
      baldness!
    when 8
      cancer!
    when 10
      reset_life
    end
  end

  # 蘇るメソッド(人生回数のみ１加算,その他はデフォルトに戻す)
  def reset_life
    self.excess_cigarette = 0
    self.life += 1
    healthy!
  end

    # 超過喫煙本数に達したらtrueを返す
  def reborn?
    excess_cigarette == 10
  end

  def set_bubble
    {
      type: "flex",
      altText: "喫煙集計の通知です。",
      contents: {
                  type: "bubble",
                  size: "mega",
                  hero: set_hero,
                  body: set_body
                  # footer: set_footer,
                  # style: set_style
                }
    }
  end

  def set_hero
    {
      type: 'image',
      url: 'https://lh3.googleusercontent.com/T4UPvBgdGfq6LUsOPXQevIhnruzGlSLXqX15_HTGowRopsMdaF8fW-jb8GNwMmP136OuMrqw74oebresStrf0cysOa3ljAGzvb3eyEdZObqmFdyG3VdQF516xNHgXA1RrGl3AbHAuOWIorj_qceLkxntKxUAuQw5Wfxm6uTlqUwYJ8BevFxfocmz_4l-GOb-pqk9fShHxRlvJiqajyfd3yMBj9h0G2YNa_xbJDJ6-oboO7MEJ9HyEZEL23xxrCdLAhUnHVleO_34BiYsuAUB052KKdR6jzQ9Tr15pnf5ZlNMLzp0Mqsc2goz7wwrpiIWe4jZJB5gK5BK6iPUkM7771d1C-5WL0cKEmCOVlialSyJt8LXWxL1F53eAfQ2Y1CZCRFb2LX3mru9nmGC3KdpmjWpSbqpeRa74l0i7CklasYr6zYnsDPBti_H3tRWAxEomJ2qmzA_SSUbXxxSY3O3Fq5rllm2kJC7vZZaEwhkLG2P-xb2dI2Ro9Rn93mxBnx28em-yeOCKBB3wCJ5ZyCoSUrJsWxYJK0zYjRWVvs119xEGJ8E0kbCW_SB5cx6GADcgSW9uuwXgeVndpyJbnWd469xBz1hXzyRfG1U6QyCaMQtoyW-vFrKK59FOBU_Tl1FdHraqpvJEHcC8FeQdjri9D-2PiaIbMg_O_35Jj6r3bdvNNxuoJbI9gFT3GywxSQCq6aFnT6tTFpOJqXRxjd2mOZ1z71uQ6CC1vaLKiYiQ3elk7KM_rFy8khJSsigYn_zCJr_OPqNCMaPWCYP3jiANd2hbqp1spfTHbh07MvNAOYUTZ8gmlpbjVmjlFdYM1WfDKcjzQjfnKZ4ml9TnaZXjj-Wx-rRcye4b-K6zJ8=w924-h600-no?authuser=2',
      size: 'full',
      aspectRatio: '20:13',
      aspectMode: 'cover',
    }
  end

  def set_body
    {
      type: "box",
      layout: "vertical",
      spacing: "md",
      contents: [
        {
          type: "text",
          text: "#{I18n.l Date.today, format: :long}"
        },
        {
          type: "text",
          text: "#{name}さんの昨日の喫煙報告",
          size: "lg",
          weight: "bold"
        },
        {
          type: "separator"
        },
        {
          type: "box",
          layout: "vertical",
          spacing: "sm",
          contents: [
            {
              type: "box",
              layout: "baseline",
              contents: [
                {
                  type: "text",
                  text: "#{I18n.l Date.yesterday}の喫煙本数",
                  weight: "bold",
                  margin: "xs",
                  flex: 0,
                  size: "md"
                },
                {
                  type: "text",
                  text: "#{yesterday_smokings_count}本",
                  size: "lg",
                  align: "end",
                  weight: "bold"
                }
              ]
            },
            {
              type: "box",
              layout: "baseline",
              contents: [
                {
                  type: "text",
                  text: "1日の目標喫煙本数",
                  weight: "bold",
                  margin: "sm",
                  flex: 0
                },
                {
                  type: "text",
                  text: "#{target_number}本",
                  size: "lg",
                  align: "end",
                  weight: "bold"
                }
              ]
            },
            {
              type: "box",
              layout: "baseline",
              contents: [
                {
                  type: "text",
                  text: "#{Date.yesterday.month}月の総喫煙本数",
                  weight: "bold",
                  margin: "sm",
                  flex: 0
                },
                {
                  type: "text",
                  text: "#{monthly_smokings_count}本",
                  size: "lg",
                  align: "end",
                  weight: "bold"
                }
              ]
            }
          ]
        },
        {
          type: "text",
          text: "バディコード: #{invite_code}",
          wrap: true,
          color: "#aaaaaa",
          size: "xxs"
        }
      ]
    }
    end

end
