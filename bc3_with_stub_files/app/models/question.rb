class Question
  def remindable?
  end

  def reminder_needed?(reminder)
    Question::Answer::Entry.for(reminder).answer_recording.blank?
  end

  private
    DEFAULT_SCHEDULE = RecurrenceSchedule.new(frequency: 'every_day', days: Array(1..5), hour: 9, minute: 0)
end
