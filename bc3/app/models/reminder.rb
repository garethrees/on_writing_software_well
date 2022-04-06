class Reminder
  def deliver
  end

  def needed?
    recording.recordable.reminder_needed?(self)
  end

  private
  def docket
    @docket ||= Reminder::Docket.new(recording, person)
  end

  def deliverable?
    scheduled? && eligible_recording? && eligible_remindee? && needed?
  end

  def eligible_recording?
  end
end
