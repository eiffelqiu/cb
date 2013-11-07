module Coronate
  module Builder
    module SceneBuilder
      def build_scene
        template 'builder/templates/scene/scene.tt', "#{@name}.lua"
      end
    end
  end
end