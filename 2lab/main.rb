require "rspec"

def exponentiationOrReverse(word)
  size = word.size

  if word[size - 2, size] == "CS"
    return 2 ** size
  else
    return word.reverse
  end

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

RSpec.describe "Main" do
    it "exponentiationOrReverse CSS=>SSC" do
        expect(exponentiationOrReverse("CSS")).to eq("SSC")
    end

    it "exponentiationOrReverse CSCS=>16" do
        expect(exponentiationOrReverse("CSCS")).to eq(16)
    end

    it "#addToPokemonsArray" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return(2, "Cho", "Green", "Wi", "Yellow")
        expect(addToPokemonsArray).to eq([{name: "Cho", color: "Green"}, {name: "Wi", color: "Yellow"}])
    end
end


