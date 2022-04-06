module User::Notifee
  extend ActiveSupport::Concern

  included do
  end

  def notifications
    @notifications ||= User::Notifications.new(self)
  end

  private
    def default_to_hiding_badge_counts
    end
end
