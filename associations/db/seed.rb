project_manager_1 = ProjectManager.create!(:first_name => "James", :last_name => "Phinney")
project_manager_2 = ProjectManager.create!(:first_name => "Shane", :last_name => "Dabiri")
project_manager_3 = ProjectManager.create!(:first_name => "Chris", :last_name => "Sigaty")

developer_1 = Developer.create!(:first_name => "Patrick", :last_name => "Wyatt")
developer_2 = Developer.create!(:first_name => "Bob", :last_name => "Fitch")
developer_3 = Developer.create!(:first_name => "David", :last_name => "Kim")

project_1 = Project.create!(:title => "StarCraft")
project_2 = Project.create!(:title => "StarCraft: Brood War")
project_3 = Project.create!(:title => "StarCraft II: Wings of Liberty")

project_manager_1.project = project_1
project_manager_2.project = project_2
project_manager_3.project = project_3

project_manager_1.developers << developer_1
project_manager_1.developers << developer_2
project_manager_1.developers << developer_3
project_manager_2.developers << developer_2
project_manager_2.developers << developer_3
project_manager_3.developers << developer_2

project_manager_1.save!
project_manager_2.save!
project_manager_3.save!