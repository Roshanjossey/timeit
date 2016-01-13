class Entry < ActiveRecord::Base
  belongs_to :user
  validates :date, :project, :duration, presence: true
  validates :billable, :inclusion => {:in => [true, false]}
end
