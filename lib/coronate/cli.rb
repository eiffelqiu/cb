require "thor"

class CLI < Thor 
  include Thor::Actions


  def self.source_root
      File.dirname(__FILE__) 
  end  
 
  desc "scene [NAME]", "generate an scene"
  def scene(name='scene1')
    template 'templates/scene.tt', "#{name}.lua"
  end

  desc "project [NAME]", "generate a corona project"

  method_option :width, :type => :numeric, :default => 320, :required => false, :aliases => "-w", :desc => "width"
  method_option :height, :type => :numeric, :default => 480, :required => false, :aliases => "-h", :desc => "height"
  method_option :landscape, :type => :boolean, :default => true, :required => false, :aliases => "-l", :desc => "landscape or not"
  def project(name='project1')
    empty_directory  "#{name}/assets"
    @width =  options[:width]
    @height =  options[:height]
    @orient =  options[:orient] ? %{ "landscapeLeft", "landscapeRight" } : %{ "portrait", "portraitUpsideDown" }
    template 'templates/main.tt', "#{name}/main.lua"
    template 'templates/utils.tt', "#{name}/utils.lua"
    template 'templates/titleScene.tt', "#{name}/titleScene.lua"
    template 'templates/endingScene.tt', "#{name}/endingScene.lua"
    template 'templates/settingsScene.tt', "#{name}/settingsScene.lua"
    template 'templates/menuScene.tt', "#{name}/menuScene.lua"
    template 'templates/config.tt', "#{name}/config.lua"
    template 'templates/build.settings.tt', "#{name}/build.settings"
  end

end