require 'rspec'
require './main.rb'

RSpec.describe "Main" do
    it "#greeting with the age of more than 18" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return("Никита", "Китайчик", 19)

        expect(greeting).to eq("Привет, Никита Китайчик. Самое время заняться делом!")
    end

    it "#greeting with an age less than 18" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return("Никита", "Китайчик", 15)

        expect(greeting).to eq("Привет, Никита Китайчик. Тебе меньше 18 лет, но начать учиться программировать никогда не рано")
    end

    it "foobar with one number equal to 20" do
        expect(foobar(20, 10)).to eq(10)
    end

    it "foobar with two numbers equal to 20" do
        expect(foobar(20, 20)).to eq(20)
    end

    it "foobar without numbers equal to 20" do
        expect(foobar(10, 5)).to eq(15)
    end
end
