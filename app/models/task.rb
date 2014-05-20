class Task < ActiveRecord::Base

scope :incomplete, -> { where(completed: false) }

validates_presence_of :title

end
