class Deliveries::ReminderDelivery < Deliveries::Delivery
  delegate :recording, to: :deliverable

  protected
    def notification
      RemindersNotification.reminder(deliverable)
    end

    def aggregation
    end

    def aggregate_after
      5.minutes
    end
end
