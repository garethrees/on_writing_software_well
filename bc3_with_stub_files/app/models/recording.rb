class Recording < ActiveRecord::Base
  include Tree, Status

  include Applaudable, Attachables, Bookmarkable, Cancelable, Categorizable, Colored, Copyable, Creators, Dockable,
          Firehoseable, Incineratable, Indexed, Invalidation, Lockable, Mentions, Movable, Notify, OrderedChildren,
          Positioned, Preloadable, Printable, Publishable, Publishing, Readable, Recordables, Remindable, Replyable,
          Threadable

  include Eventable   # Depends on Recordables
  include Assignable  # Dpeneds on Subscribable
  include Completable # Depends on Positioned

  belongs_to :bucket, touch: true
  belongs_to :creator, class_name: 'Person', default: -> { Current.person }

  scope :reverse_chronologically, -> { order('recordings.created_at desc, recordings.id desc') }

  delegate :account, to: :bucket

  # Duck type with objects that have a Recording. E.g., applaudable.recording when applaudable is a Recording.
  def recording
    self
  end
end
