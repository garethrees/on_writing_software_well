module Recording::Subscribable
  extend ActiveSupport::Concern

  included do
    has_many :subscriptions, dependent: :delete_all
    has_many :subscribers, through: :subscriptions

    after_create { subscribe(creator) if subscribable? }
  end

  def subscribable?
    recordable.subscribable?
  end

  def subscribe(people, track: false)
  end

  def unsubscribe(people, track: false)
  end

  def change_subscribers(added: [], removed: [], track: false, notify: false)
  end

  def replace_subscribers(people)
  end

  def subscribable_container
  end

  def subscribers_without_creator
  end

  def subscribed_by?(person)
  end

  private
    def eligible_as_subscribers(people)
    end

    # Deal with race-conditions where someone already subscribed by another process is returned as an eligible_as_subscriber
    # and the database barfs at the unique constraint.
end
