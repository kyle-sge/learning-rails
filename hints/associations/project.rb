class Project < ActiveRecord::Base
  attr_accessible :title

  # A project has a single manager
  # A project may be worked on by the developers beloning to the project manager
end