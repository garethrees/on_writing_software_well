class MessagesController < ApplicationController
  include SetRecordable, BucketScoped
  include GuidedSetupHelper, Subscribers, RecordingStatusParam

  before_action :set_parent_recording, only: %[ index new create ]

  wrap_parameters Message

  def index
  end

  def show
  end

  def new
  end

  def create
    @recording = @bucket.record new_message, parent: @parent_recording, status: status_param,
      subscribers: find_subscribers, category: find_category

    if guided_setup?
      complete_guided_setup
    else
      respond_to do format|
        format.any(:html, :js) { redirect_to edit_subscriptions_or_guided_recordable_url(@recording) }
        format.json { render :show, status: :created }
      end
    end
  end

  def edit
  end

  def update
    if @recording.drafted?
      @recording.update! recordable: new_message, status: status_param, subscribers: find_subscribers + [???]
    else
      @recording.update! recordable: new_message, status: status_param, category: find_category
    end

    respond_to do |format|
      format.any(:html, :js) { redirect_to edit_subscriptions_or_guided_recordable_url(@recording) }
      format.json { render :show }
    end
  end

  private

    def set_parent_recording
    end

    def new_message
      Message.new params.require(:message).permit(:subject, :content)
    end

    def find_subscribers
    end

    def complete_guided_setup
    end

    def new_guided_setup_message
    end

    def find_category
    end
end
