module Coronate
	module Builder
		module EbookBuilder 

			def build_ebook(options={})
				@name, @width, @height  = options[:name], options[:width], options[:height] 
				@orient = if options[:landscape] then  %{ "landscapeLeft", "landscapeRight" } else %{ "portrait", "portraitUpsideDown" } end	

				template 'builder/templates/ebook/build.settings.tt', "#{@name}/build.settings"
				template 'builder/templates/ebook/title.lua.tt', "#{@name}/title.lua"
				template 'builder/templates/ebook/config.lua.tt', "#{@name}/config.lua"
				template 'builder/templates/ebook/main.lua.tt', "#{@name}/main.lua"
				template 'builder/templates/ebook/page1.lua.tt', "#{@name}/page1.lua"

				copy_file 'builder/templates/ebook/coronaicon-big.png', "#{@name}/coronaicon-big.png"
				copy_file 'builder/templates/ebook/cover.jpg', "#{@name}/cover.jpg"
				copy_file 'builder/templates/ebook/moon.png', "#{@name}/moon.png"
				copy_file 'builder/templates/ebook/pagebg1.png', "#{@name}/pagebg1.png"	
				copy_file 'builder/templates/ebook/space.jpg', "#{@name}/space.jpg"
				copy_file 'builder/templates/ebook/sun.png', "#{@name}/sun.png"
			end

		end
	end
end