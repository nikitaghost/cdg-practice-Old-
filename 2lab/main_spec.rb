require "rspec"
require "./main.rb"

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