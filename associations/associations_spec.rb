require "active_record"
require "developer"
require "project"
require "project_manager"

def execute_rake(file,task)
  require 'rake'
  rake = Rake::Application.new
  Rake.application = rake
  load "#{file}"
  rake[task].invoke
end

describe "the associations" do

  before(:all) do
    execute_rake("databases.rake", "db:reset")
    require "#{File.expand_path File.dirname(__FILE__)}/db/seed.rb"
  end

  it "retrieves a project for each project manager" do
    ProjectManager.all.each do |project_manager|
      project_manager.respond_to?(:project).should == true
      project_manager.project.is_a?(Project)
    end
  end

  it "retrieves a project manager for each project" do
    Project.all.each do |project|
      project.respond_to?(:project_manager).should == true
      project.project_manager.is_a?(ProjectManager)
    end
  end

  it "retrieves developers for each project manager" do
    ProjectManager.all.each do |project_manager|
      project_manager.respond_to?(:developers).should == true
      project_manager.developers.each {|d| d.is_a?(Developer).should == true}
    end
  end

  it "retrieves project managers for each developer" do
    Developer.all.each do |developer|
      developer.respond_to?(:project_managers).should == true
      developer.project_managers.each {|pm| pm.is_a?(ProjectManager).should == true}
    end
  end

  it "retrieves developers for each project" do
    Project.all.each do |project|
      project.respond_to?(:developers).should == true
      project.developers.each {|d| d.is_a?(Developer).should == true}
    end
  end

  it "retrieves projects for each developer" do
    Developer.all.each do |developer|
      developer.respond_to?(:projects).should == true
      developer.projects.each {|p| p.is_a?(Project).should == true}
    end
  end

end