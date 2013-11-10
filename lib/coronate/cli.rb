require 'thor'
require_relative 'ext/string_extention'
%w[project app game ebook scene].each { |task| require_relative "builder/#{task}_builder" }

class Coronate::CLI < Thor
  include Thor::Actions
  Coronate::Builder.constants.each { |b| include "Coronate::Builder::#{b}".to_class }

  def initialize(*args); super; processing(*args) end

  def self.source_root; File.dirname(__FILE__) end

  class_option :width, :type => :numeric, :default => 320, :required => false, :aliases => "-w", :desc => "width"
  class_option :height, :type => :numeric, :default => 480, :required => false, :aliases => "-h", :desc => "height"
  class_option :layout, :type => :boolean, :default => true, :required => false, :aliases => "-l", :desc => "layout"

  %w[scene project game ebook app].each do |type|
    class_eval %{
      desc "#{type} [NAME]", "generate a corona #{type}"
      def #{type}(name=nil) end
    }
  end

  private
  def processing(*args)
    method = args[2][:current_command][:name] # default project name is app type name
    @name, @width, @height, @orient = args[0][0] || "#{method}", options[:width], options[:height],
                                      options[:layout] ? # default portrait
                                       %{ "portrait", "portraitUpsideDown" } : %{ "landscapeLeft", "landscapeRight" }
    send "build_#{method}" if method != 'help' 
  end
end