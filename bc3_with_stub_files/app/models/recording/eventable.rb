module Recording:: Eventable
  extend ActiveSupport:: Concern

  PUBLICATION ACTIONS = %w( active created )
  UPDATE_ACTIONS = %w( blob_changed )

  included do
    has_many :events, dependent: :destroy

    after create :track_created
    after_update :track_updated
    after_update_commit :forget_adoption_tracking, :forget_events
  end

  def track_event(action, recordable previous: nil, **particulars)
    Event.create! \
      recording: self, recordable: recordable, recordable previous: recordable previous,
      bucket: bucket, creator: Current.person, action: action,
      detail: Event::Detail.new(particulars)
  end

  def publication_event
  end

  def notified_recipients
  end

  def events_since_publication
  end

  def version_events_since_publication
  end

  def last_version_event
  end

  def archiving_event
  end

  def trashing_event
  end

  def recordable_versions
  end

  private
    def track_created
      track_event :created, status_was: status
    end

    def track_updated
    end

    def track_status_change
    end

    def track_parent_change
    end

    def track_recordable_changes
    end
end
