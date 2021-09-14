puts "Enter word:"
word = gets.chop
word = word.strip

def exponentiationOrReverse(word)
  size = word.size

  if word[size - 2, size] == "CS"
    return 2 ** size
  else
    return word.reverse
  end

end

puts exponentiationOrReverse(word)

#Второе задание

puts "Enter num of pokemons:"
numOfPokemons = gets.to_i

def addToPokemonsHash(numOfPokemons)
  pokemonHash = nil
  name = nil
  color = nil

  pokemonsArr = []

  for i in 1..numOfPokemons do
    puts "Enter name:"
    name = gets.chop
    puts "Enter color:"
    color = gets.chop

    pokemonHash = {"name" => name, "color" => color}
    pokemonsArr.push(pokemonHash)
  end

  return pokemonsArr

end

pokemonsArr = addToPokemonsHash(numOfPokemons)

puts pokemonsArr