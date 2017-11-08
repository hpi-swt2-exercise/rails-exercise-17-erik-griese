class Paper < ActiveRecord::Base
  has_many :authors
  validates :title, presence: true
end
