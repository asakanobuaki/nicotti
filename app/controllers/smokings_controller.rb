class SmokingsController < ApplicationController

  def new;end

  def index
    @smokings = current_user.smokings
    @per_day_smokings = current_user.per_day_smokings
  end

  def create
    @smoking = current_user.smokings.build
    @smoking.save!
    
    @user = User.find(current_user.id)
    reborn = false

    if current_user.smokings.where(created_at: Date.today.all_day).count > current_user.target_number
      @user.excess_cigarette += 1
      @user.save

      # ここからモデルにメソッド作る方がいい
      if @user.excess_cigarette == 6
        @user.baldness!
      elsif @user.excess_cigarette == 8
        @user.cancer!
      elsif @user.excess_cigarette == 10
        @user.reset_life
        reborn = true
      end
    end

    user_smoking = @user.smokings.where(created_at: Date.today.all_day).count
    remianing_smoking = @user.target_number - user_smoking

    @latest_smoking = current_user.smokings.order(created_at: :desc).limit(1)[0]
    partial = render_to_string(partial: 'smoking', :locals => { smoking: @latest_smoking })
   
    respond_to do |format|
      format.html
      format.json { render json: {
                    id: @user.id, 
                    excess_cigarette: @user.excess_cigarette,
                    state: @user.state,
                    user_smoking: user_smoking,
                    remianing_smoking: remianing_smoking,
                    reborn: reborn,
                    html: partial
                  }
      }
    end

  end

  def destroy
    @smoking = current_user.smokings.order(created_at: :desc).limit(1)
    @smoking.destroy
  end
end