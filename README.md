## Corona project builder tools.


### Installation

    $ gem install coronate 

### Help

    $ coronate 
	Commands:
	  coronate app [NAME]      # generate a corona app project
	  coronate ebook [NAME]    # generate a corona ebook project
	  coronate game [NAME]     # generate a corona game project
	  coronate help [COMMAND]  # Describe available commands or one specific command
	  coronate project [NAME]  # generate a corona project
	  coronate scene [NAME]    # generate an scene

### Generate a corona blank project

    $ cb project helloworld   # default width=320 height=480 orientation=landscape
    $ cb project helloworld -w 320 -h 568 --no-landscape # width=320 height=568 orientation=portrait         	  

### Generate a corona game project

    $ cb game hellogame   # default width=320 height=480 orientation=landscape
    $ cb game hellogame -w 320 -h 568 --no-landscape # width=320 height=568 orientation=portrait 

### Generate a corona ebook project

    $ cb ebook helloebook   # default width=320 height=480 orientation=landscape
    $ cb ebook helloebook -w 320 -h 568 --no-landscape # width=320 height=568 orientation=portrait 

### Generate a corona app project

    $ cb app helloapp   # default width=320 height=480 orientation=landscape
    $ cb app helloapp -w 320 -h 568 --no-landscape # width=320 height=568 orientation=portrait         
    
### Generate a scene file

    $ coronate scene page1
    
