module Coronate
  module Builder
    module SceneBuilder
      def build_scene(name, options={})
        @name, @width, @height = name, options[:width], options[:height]
        @orient = if options[:landscape] then
                    %{ "landscapeLeft", "landscapeRight" }
                  else
                    %{ "portrait", "portraitUpsideDown" }
                  end
        template 'builder/templates/scene/scene.tt', "#{name}.lua"
      end
    end
  end
end