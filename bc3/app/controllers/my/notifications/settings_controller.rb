class My::Notifications::SettingsController < ApplicationController
  after_action :track_update_for_customer, only: :update

  def show
  end

  def edit
  end

  def update
    update_platforms
    update_presentations
    update_granularity
    update_schedule
    update_bundle

    redirect_to edit_my_notifications_settings_url, notice: 'Settings saved!'
  end

  private
    def default_schedule
    end

    def update_platforms
    end

    def update_presentations
    end

    def update_granularity
      Current.user.notifications.granularity.choice = params[:granularity]
    end

    def update_schedule
    end

    def update_bundle
    end

    def schedule_params
    end

    def schedule_work_days
    end
end
