class Task < ActiveRecord::Base

	belongs_to :user

	scope :incomplete, -> { where(completed: false) }

	validates_presence_of :title

end
