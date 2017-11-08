class Author < ActiveRecord::Base
  has_many :papers
  validates :last_name, presence: true

  def name
    name_seperation = " "
    return first_name + name_seperation + last_name
  end

end
