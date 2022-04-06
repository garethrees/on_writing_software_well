class Recording::Incineratable::Incineration
  class RecordableNeedsIncineration < StandardError; end

  def initialize(recording)
    @recording = recording
  end

  def run
    if possible?
      incinerate_children(@recording)
      incinerate_dependents(@recording)
    end
  end

  def possible?
    incineratable_via_self? || incineratable_via_bucket?
  end

  private
    def incineratable_via_self?
      @recording.deleted? && due? && !has_incineratable_ancestor?
    end

    def incineratable_via_bucket?
      incineratable_bucket? && !has_incineratable_ancestor?
    end

    def has_incineratable_ancestor?
      @recording.ancestors.detect { |a| Recording::Incineratable::Incineration.new(a).possible? }
    end

    def incineratable_bucket?
      Bucket::Incineratable::Incineration.new(@recording.bucket).possible?
    end

    def due?
      @recording.updated_at < Recording::Incineratable::INCINERATABLE_AFTER.ago.end_of_day
    end

    def incinerate_children(recording)
      @recording.descendents.each do |child|
        incinerate_dependents(child)
      end
    end

    def incinerate_dependents(recording)
      Bucket.no_touching do
        Recording.no_touching do
          incinerate_recordables(recording)

          incinerate_recording(recording)
        end
      end
    end

    def incinerate_recording(recording)
      if recordable_incinerated?(recording)
        recording.destroy
      else
        rerun_incineration
      end
    end

    def incinerate_recordables(recording)
    end

    def incinerate_recordable(recording, recordable)
      Recordable::Incineration.new(recording, recordable).run
    end

    def recordable_incinerated?(recording)
    end

    # Recordables can be shared between recordings and may encounter a
    # race condition when being incinerated. Retry incineration in this case.
    def rerun_incineration
      raise RecordableNeedsIncineration.new("Recording's recordable was not incinerated. Retry incineration.")
    end
end
