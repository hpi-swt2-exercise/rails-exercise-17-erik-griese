class Paper < ActiveRecord::Base
  has_many :authors
  validates :title, :venue, presence: true
end
