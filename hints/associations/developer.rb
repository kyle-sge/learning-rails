class Developer < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  # A developer can have many project managers
  # A developer may work on many projects that belong to his or her project manager
end