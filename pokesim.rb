#!/usr/bin/env ruby
#
# Simulate Pokémon battles.
#

class Pokemon
  @@poke_list = Hash.new()

  attr_accessor :name

  def initialize(name)
    if @@poke_list.length == 6
      puts "You already have 6 Pokémon!"
    elsif @@poke_list.length > 6
      puts "ERROR: total Pokémon over 6"
    else
      @name = name
      # store in hash using a symbol
      @id = Random.rand().to_s.to_sym
      @@poke_list[@id] = @name
      puts "You caught #{name}!"
    end
  end

  public
  def rename(name)
    # Name changing is accessed through a public method rather than directly
    # changing the variable, so we can restrict certain words (e.g. fuck, shit,
    # balls :D)
    if name == "DEAD"
      puts "That name isn't allowed!"
    elsif name == @name
      puts "That name isn't different!"
    else
      @name = name
      @@poke_list[@id] = @name
    end
  end

  def release
    @@poke_list[@id] = "DEAD"
    puts "#{name} has been released!"
  end

  def show_id
    puts "usually you won't ever see this"
    @id
  end

  def list
    puts "this shouldn't happen"
    @@poke_list
  end
end

#class Torchic
#  extend or include ?
#end

raehik = Pokemon.new("Raehik")
puts raehik.name
raehik.rename("Torchic")
puts raehik.name
raehik.rename("DEAD")
puts raehik.name
puts raehik.show_id
puts raehik.list
raehik.release
puts raehik.show_id
puts raehik.list
