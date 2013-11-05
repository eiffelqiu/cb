require "thor"

class CLI < Thor 
  include Thor::Actions


  def self.source_root
      File.dirname(__FILE__) 
  end  
 
  desc "scene", "generate an scene"
  def scene(name='scene1')
    template 'templates/scene.tt', "#{name}.lua"
  end

  desc "project", "generate a corona project"
  def project(name='project1')
    empty_directory  "#{name}/assets"
    template 'templates/main.tt', "#{name}/main.lua"
    template 'templates/utils.tt', "#{name}/utils.lua"
    template 'templates/titleScene.tt', "#{name}/titleScene.lua"
    template 'templates/endingScene.tt', "#{name}/endingScene.lua"
    template 'templates/settingsScene.tt', "#{name}/settingsScene.lua"
    template 'templates/menuScene.tt', "#{name}/menuScene.lua"
  end

end