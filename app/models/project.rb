class Project < ActiveRecord::Base
  validates :name, :billable, presence: true
  has_many :entries
end
