class Paper < ActiveRecord::Base
  has_many :authors
  validates :title, :venue, :year, presence: true
  validates :year, numericality: {only_integer: true}
end
