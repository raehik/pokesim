#!/usr/bin/env ruby
#
# Simulate Pokémon battles.
#

class Pokemon
  @@total_pokemon = 0

  attr_accessor :name

  def initialize(name)
    if @@total_pokemon == 6
      puts "You already have 6 Pokémon!"
    elsif @@total_pokemon > 6
      puts "ERROR: total Pokémon over 6"
    else
      @name = name
      @id = Random.rand(11)
      @@total_pokemon += 1
    end
  end

  public
  def rename(name)
    # Name changing is accessed through a public method rather than directly
    # changing the variable, so we can restrict certain words (e.g. fuck, shit,
    # balls :D)
    if name == "restricted"
      puts "That name isn't allowed!"
    elsif name == @name
      puts "That name isn't different!"
    else
      @name = name
    end

    def release
      @@total_pokemon -= 1
      puts "How to delete this Pokémon? Should I keep a list of IDs currently
            in the party?"
    end

    def show_id
      puts "usually you won't ever see this"
      @id
    end
  end
end

#class Torchic
#  extend or include ?
#end

raehik = Pokemon.new("Raehik")
puts raehik.name
raehik.rename("Torchic")
puts raehik.name
raehik.rename("restricted")
puts raehik.name
puts raehik.show_id
