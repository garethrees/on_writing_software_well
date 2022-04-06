class Client < ActiveRecord::Base
  include Personable

  def attributes_for_person
    {}
  end
end
