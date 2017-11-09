class Paper < ActiveRecord::Base
  has_and_belongs_to_many :authors
  validates :title, :venue, :year, presence: true
  validates :year, numericality: {only_integer: true}

  def self.with_year(year)
    return self.all.select { |element| element.year == year }
  end
end
