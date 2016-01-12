class Entry < ActiveRecord::Base
  belongs_to :user
  validates :date, :project, :duration, :billable, presence: true
end
