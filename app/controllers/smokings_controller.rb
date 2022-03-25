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
    @user.target_over
    reborn = @user.reborn?
    @user.user_state

    @latest_smoking = current_user.smokings.order(created_at: :desc).limit(1)[0]
    partial = render_to_string(partial: 'smoking', :locals => { smoking: @latest_smoking })
   
    respond_to do |format|
      format.html
      format.json { render json: {
                    id: @user.id, 
                    excess_cigarette: @user.excess_cigarette,
                    state: @user.state,
                    life: @user.life,
                    user_smoking: @user.today_smokings_count,
                    remaining_smoking: @user.remaining_number,
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