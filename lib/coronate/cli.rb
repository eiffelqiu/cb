require 'thor'

%w[project app game ebook scene].each { |mb| require_relative "builder/#{mb}_builder" }

class Coronate::CLI < Thor
  include Thor::Actions
  include Coronate::Builder::EbookBuilder, Coronate::Builder::AppBuilder, Coronate::Builder::GameBuilder
  include Coronate::Builder::ProjectBuilder, Coronate::Builder::SceneBuilder

  def initialize(*args)
    super
    processing(args[0][0], args[2][:current_command][:name])
  end

  def self.source_root
    File.dirname(__FILE__)
  end

  class_option :width, :type => :numeric, :default => 320, :required => false, :aliases => "-w", :desc => "width"
  class_option :height, :type => :numeric, :default => 480, :required => false, :aliases => "-h", :desc => "height"
  class_option :landscape, :type => :boolean, :default => false, :required => false, :aliases => "-l", :desc => "landscape or not"

  desc "scene [NAME]", "generate an scene"
  def scene(name='scene1') end

  desc "project [NAME]", "generate a corona project"
  def project(name='project1') end

  desc "game [NAME]", "generate a corona game project"
  def game(name='game1') end

  desc "ebook [NAME]", "generate a corona ebook project"
  def ebook(name='ebook1') end

  desc "app [NAME]", "generate a corona app project"
  def app(name='app1') end

  private

  def processing(name,method)
    @name, @width, @height, @orient = name,
        options[:width],
        options[:height],
        options[:landscape] ?
            %{ "landscapeLeft", "landscapeRight" } : %{ "portrait", "portraitUpsideDown" }
    send "build_#{method}"
  end

end