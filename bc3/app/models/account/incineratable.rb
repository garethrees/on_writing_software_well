class Account::Incineratable
  extend ActiveSupport::Concern

  INCINERATABLE_AFTER = 30.days

  included do
    set_callback(:cancel, :after) { incinerate_later }
  end

  def incinerate
    Incineration.new(self).run
  end

  private
    def incinerate_later
      Account::IncinerateJob.schedule(self) if cancelled?
    end
end
