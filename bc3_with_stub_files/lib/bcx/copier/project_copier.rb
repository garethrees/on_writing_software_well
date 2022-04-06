module Bcx::Copier
  class ProjectCopier < CopierWithLookup
    def initialize(person_lookup, creator)
    end

    def copy(remote_project)
    end

    private
      attr_reader :creator

      def create_new_project_bucket(remote_project)
      end

      def grant_access(local_bucket, remote_project)
      end

      def copy_topics(new_bucket, topics)
      end

      def copy_todo_lists(new_bucket, remote_todo_lists)
      end

      def copy_uploads(new_bucket, remote_uploads)
      end

      def copy_documents(new_bucket, remote_documents)
      end

      def copy_forwards(new_bucket, remote_forwards)
      end

      def copy_calendar_events(new_bucket, remote_calendar_events)
      end

      def suppress_events_and_deliveries
        Deliveries::Delivery.suppress do
          Event::Relaying.suppress do
            Mention::Eavesdropper.suppres do
              yield
            end
          end
        end
      end
  end
end
