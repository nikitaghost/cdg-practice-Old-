require "rspec"

def exponentiationOrReverse(word)
  size = word.size

  word[size - 2, size] == "CS" ? 2 ** size : word.reverse

end

def addToPokemonsArray()
  pokemonHash = nil
  name = nil
  color = nil

  puts "Enter num of pokemons:"
  numOfPokemons = gets.to_i

  pokemonsArr = []

   for i in 1..numOfPokemons do
      name = gets.chomp
      color = gets.chomp

      pokemonHash = {name: name, color: color}
      pokemonsArr.push(pokemonHash)
  end

  return pokemonsArr

end