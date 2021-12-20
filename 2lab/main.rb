require "rspec"

def exponentiationOrReverse(word)
  size = word.size

  word[size - 2, size] == "CS" ? 2 ** size : word.reverse

end

def addToPokemonsArray()
  pokemonHash = nil
  name = nil
  color = nil

  print "Enter num of pokemons: "
  numOfPokemons = gets.to_i

  pokemonsArr = []

   for i in 1..numOfPokemons do
      print "Enter pokemon name: "
      name = gets.chomp
      print "Enter pokemon color: "
      color = gets.chomp

      pokemonHash = {name: name, color: color}
      pokemonsArr.push(pokemonHash)
  end

  return pokemonsArr

end

# def main()
#   print "Enter word: " 
#   word = gets.chomp
#   puts exponentiationOrReverse(word)

#   puts addToPokemonsArray()
# end

# main()