## Corona project builder tools.


### Installation

    $ gem install coronate 

### Help

    $ coronate 
    Commands:
    coronate help [COMMAND]  # Describe available commands or one specific command
  	coronate project [NAME]  # generate a corona project
  	coronate scene [NAME]    # generate an scene

### Generate Corona Porject

    $ cb project helloworld   # default width=320 height=480 orientation=landscape
    $ cb project helloworld -w 320 -h 568 --no-landscape # default width=320 height=568 orientation=portrait 
    
### Generate a scene file

    $ coronate scene page1
    
