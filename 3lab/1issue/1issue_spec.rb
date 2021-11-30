require 'rspec'
require './1issue.rb'

RSpec.describe "task1" do
    before {File.write($usersPath, "Matthew McConaughey\nRyan Gosling\nSylvester Stallone\nLeonardo DiCaprio")}
    
    it "#index"do
      expect{index}.to output("Matthew McConaughey\nRyan Gosling\nSylvester Stallone\nLeonardo DiCaprio\n").to_stdout
    end
  
    it "#where" do
      expect(where("Ryan Gosling")).to eq(1)
    end
  
    it "#update" do
      update(0, "Kirill Biller")
      expect{index}.to output("Kirill Biller\nRyan Gosling\nSylvester Stallone\nLeonardo DiCaprio\n").to_stdout
    end
  
    it "#delete" do
      delete(0)
      expect{index}.to output("Ryan Gosling\nSylvester Stallone\nLeonardo DiCaprio\n").to_stdout
    end
  
    it "#find" do
      expect{find(2)}.to output("Sylvester Stallone\n").to_stdout
    end
end