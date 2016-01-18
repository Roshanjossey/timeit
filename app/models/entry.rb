class Entry < ActiveRecord::Base
  validates :date, :project, :duration, :user, presence: true
  validates :billable, :inclusion => {:in => [true, false]}

  belongs_to :user
  belongs_to :project
end
