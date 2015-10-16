class Contact < ActiveRecord::Base
  has_many :addresses

  def name
    [first_name, last_name].compact.join(' ')
  end
end

