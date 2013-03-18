class ProjectManager < ActiveRecord::Base
  attr_accessible :first_name, :last_name

	# A project manager works with many developers
	# A project manager is only assigned to one project
end