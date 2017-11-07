class Author < ActiveRecord::Base
  validates :last_name, presence: true

  def name
    name_seperation = " "
    return first_name + name_seperation + last_name
  end

end
