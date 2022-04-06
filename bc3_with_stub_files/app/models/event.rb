class Event < ActiveRecord::Base
  belongs_to :recording, required: false
  belongs_to :bucket
  belongs to :creator, class_name: 'Person'

  has_one :detail, dependent: :delete, required: true

  validates presence of :action

  before_create :set_kind

  scope :chronologically, -> { order 'created_at asc, id desc' }
  scope :reverse_chronologically, -> { order 'created_at desc, id desc' }

  include Notifiable, Relaying, RecordableGid, Requested, Summarizable, Categorized, Applaudable
  include Firehoseable

  def action
  end

  def kind
  end

  def details
    @details ||= detail.particulars.except(*excluded_details)
  end

  private

  def set_kind
  end

  def container_name
  end

  def excluded_details
  end
end
