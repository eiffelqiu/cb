module Coronate
  module Builder
    module AppBuilder
      def build_app
        template 'builder/templates/app/build.settings.tt', "#{@name}/build.settings"
        template 'builder/templates/app/config.lua.tt', "#{@name}/config.lua"
        template 'builder/templates/app/view1.lua.tt', "#{@name}/view1.lua"
        template 'builder/templates/app/view2.lua.tt', "#{@name}/view2.lua"
        template 'builder/templates/app/main.lua.tt', "#{@name}/main.lua"

        copy_file 'builder/templates/app/icon1-down.png', "#{@name}/icon1-down.png"
        copy_file 'builder/templates/app/icon1-down@2x.png', "#{@name}/icon1-down@2x.png"
        copy_file 'builder/templates/app/icon2-down.png', "#{@name}/icon2-down.png"
        copy_file 'builder/templates/app/icon2-down@2x.png', "#{@name}/icon2-down@2x.png"
        copy_file 'builder/templates/app/icon1.png', "#{@name}/icon1.png"
        copy_file 'builder/templates/app/icon1@2x.png', "#{@name}/icon1@2x.png"
        copy_file 'builder/templates/app/icon2.png', "#{@name}/icon2.png"
        copy_file 'builder/templates/app/icon2@2x.png', "#{@name}/icon2@2x.png"
      end
    end
  end
end