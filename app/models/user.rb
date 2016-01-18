class User < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  has_many :entries
end
