class User < ActiveRecord::Base
  include Personable  
  include SignalUser, AccountsSharingIdentity

  include Applause, Appearant, Announcee, Assigner, Bookmarker, Devicee,
          Drafter, Locker, Notifiee, Profiled, Reader, Reportee

  def attributes_for_person
  end

  def enroll(enrolee_params)
  end

  def settings
  end
end