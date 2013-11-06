require "thor"

%w[project app game ebook scene].each { |mb| require_relative "builder/#{mb}_builder" }

class Coronate::CLI < Thor
  include Thor::Actions
  include Coronate::Builder::ProjectBuilder, Coronate::Builder::AppBuilder, Coronate::Builder::GameBuilder, Coronate::Builder::EbookBuilder, Coronate::Builder::SceneBuilder

  def self.source_root
    File.dirname(__FILE__)
  end

  class_option :width, :type => :numeric, :default => 320, :required => false, :aliases => "-w", :desc => "width"
  class_option :height, :type => :numeric, :default => 480, :required => false, :aliases => "-h", :desc => "height"
  class_option :landscape, :type => :boolean, :default => false, :required => false, :aliases => "-l", :desc => "landscape or not"

  desc "scene [NAME]", "generate an scene"
  def scene(name='scene1')
    build_scene(name, options)
  end

  desc "project [NAME]", "generate a corona project"
  def project(name='project1')
    build_project(name, options)
  end

  desc "game [NAME]", "generate a corona game project"
  def game(name='game1')
    build_game(name, options)
  end

  desc "ebook [NAME]", "generate a corona ebook project"
  def ebook(name='ebook1')
    build_ebook(name, options)
  end

  desc "app [NAME]", "generate a corona app project"
  def app(name='app1')
    build_app(name, options)
  end

end