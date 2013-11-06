module Coronate
  module Builder
    module SceneBuilder
      def build_scene(options)
        @name, @width, @height, @orient = options[:name],
            options[:width],
            options[:height],
            options[:landscape] ?
                %{ "landscapeLeft", "landscapeRight" } : %{ "portrait", "portraitUpsideDown" }

        template 'builder/templates/scene/scene.tt', "#{@name}.lua"
      end
    end
  end
end