class Account::Incineratable::Incineration
  def initialize(bucket)
    @bucket = bucket
  end

  def run
    if possible?
      incinerate_recordings
      incinerate_bucket
    end
  end

  def possible?
    incineratable_via_self? || incineratable_via_account?
  end

  private
    def due?
      @bucket.updated_at < Bucket::Incineratable::INCINERATABLE_AFTER.ago.end_of_day
    end

    def incineratable_via_self?
      @bucket.deleted? && due? && !incineratable_via_account?
    end

    def incineratable_via_account?
      Account::Incineratable::Incineration.new(@bucket.account).possible?
    end

    def incinerate_recordings
      @bucket.recordings.roots.each do |recording|
        Recording::Incineratable::Incineration.new(recording).run
      end
    end

    def incinerate_bucket
      @bucket.destroy
    end
end
