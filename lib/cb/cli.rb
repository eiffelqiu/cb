require "thor"

class CLI < Thor
  desc "ipsum", "Lorem text generator"
  def ipsum
    puts "Lorem Ipsum blah blah blah"
  end
end