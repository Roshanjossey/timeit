class Entry < ActiveRecord::Base
  belongs_to :user
  validates :date, :project, :duration, :billable, :description, presence: true
end
