module Recordable
  extend ActiveSupport::Concern

  def remindable?
  end

  # Allow recordables to specify whether a specific reminder is still needed for the recipient
  def reminder_needed?(reminder)
    true
  end

  # Allow recordables to specify whether they can be replied to.
  def replyable?
    false
  end
end
