module Coronate
  module Builder
    module GameBuilder

      def build_game(name, options={})
        @name, @width, @height = name, options[:width], options[:height]
        @orient = if options[:landscape] then
                    %{ "landscapeLeft", "landscapeRight" }
                  else
                    %{ "portrait", "portraitUpsideDown" }
                  end

        template 'builder/templates/game/build.settings.tt', "#{@name}/build.settings"
        template 'builder/templates/game/config.lua.tt', "#{@name}/config.lua"
        template 'builder/templates/game/main.lua.tt', "#{@name}/main.lua"
        template 'builder/templates/game/menu.lua.tt', "#{@name}/menu.lua"
        template 'builder/templates/game/level1.lua.tt', "#{@name}/level1.lua"

        copy_file 'builder/templates/game/background.jpg', "#{@name}/background.jpg"
        copy_file 'builder/templates/game/button-over.png', "#{@name}/button-over.png"
        copy_file 'builder/templates/game/button.png', "#{@name}/button.png"
        copy_file 'builder/templates/game/crate.png', "#{@name}/crate.png"
        copy_file 'builder/templates/game/grass.png', "#{@name}/grass.png"
        copy_file 'builder/templates/game/logo.png', "#{@name}/logo.png"
      end

    end
  end
end