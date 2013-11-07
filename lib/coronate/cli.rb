require 'thor'
require_relative 'extensions/string_extention'
%w[project app game ebook scene].each { |task| require_relative "builder/#{task}_builder" }

class Coronate::CLI < Thor
  include Thor::Actions
  Coronate::Builder.constants.each { |b| include "Coronate::Builder::#{b}".to_class }

  def initialize(*args)
    super
    method = args[2][:current_command][:name]
    processing(args[0][0] || "#{method}" , method)  # default project name is app type name
  end

  def self.source_root
    File.dirname(__FILE__)
  end

  class_option :width, :type => :numeric, :default => 320, :required => false, :aliases => "-w", :desc => "width"
  class_option :height, :type => :numeric, :default => 480, :required => false, :aliases => "-h", :desc => "height"
  class_option :landscape, :type => :boolean, :default => false, :required => false, :aliases => "-l", :desc => "landscape or not"

  desc "scene [NAME]", "generate an scene"
  def scene(name=nil) end

  desc "project [NAME]", "generate a corona project"
  def project(name=nil) end

  desc "game [NAME]", "generate a corona game project"
  def game(name=nil) end

  desc "ebook [NAME]", "generate a corona ebook project"
  def ebook(name=nil) end

  desc "app [NAME]", "generate a corona app project"
  def app(name=nil) end

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