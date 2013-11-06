module Coronate
  module Builder
    module ProjectBuilder
      def build_project(name, options={})
        @name, @width, @height = name, options[:width], options[:height]
        @orient = if options[:landscape] then
                    %{ "landscapeLeft", "landscapeRight" }
                  else
                    %{ "portrait", "portraitUpsideDown" }
                  end
        empty_directory "#{@name}/assets"
        template 'builder/templates/project/main.tt', "#{@name}/main.lua"
        template 'builder/templates/project/utils.tt', "#{@name}/utils.lua"
        template 'builder/templates/project/titleScene.tt', "#{@name}/titleScene.lua"
        template 'builder/templates/project/endingScene.tt', "#{@name}/endingScene.lua"
        template 'builder/templates/project/settingsScene.tt', "#{@name}/settingsScene.lua"
        template 'builder/templates/project/menuScene.tt', "#{@name}/menuScene.lua"
        template 'builder/templates/project/config.tt', "#{@name}/config.lua"
        template 'builder/templates/project/build.settings.tt', "#{@name}/build.settings"
      end
    end
  end
end