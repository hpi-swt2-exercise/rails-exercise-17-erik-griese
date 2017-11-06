class Author < ActiveRecord::Base

  def name
    name_seperation = " "
    return first_name + name_seperation + last_name
  end

end
