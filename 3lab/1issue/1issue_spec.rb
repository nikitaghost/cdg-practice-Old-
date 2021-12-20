require 'rspec'
require './1issue.rb'

RSpec.describe "task1" do
    before {File.write($usersPath, "Nikita Kitaychik\nArtem Shirma\nArtem Ivasenko\nAlan Sadriev")}
    
    it "#index"do
      expect{index}.to output("Nikita Kitaychik\nArtem Shirma\nArtem Ivasenko\nAlan Sadriev\n").to_stdout
    end
  
    it "#where" do
      expect(where("Artem Shirma")).to eq(1)
    end
  
    it "#update" do
      update(0, "Roman Isaev")
      expect{index}.to output("Roman Isaev\nArtem Shirma\nArtem Ivasenko\nAlan Sadriev\n").to_stdout
    end
  
    it "#delete" do
      delete(0)
      expect{index}.to output("Artem Shirma\nArtem Ivasenko\nAlan Sadriev\n").to_stdout
    end
  
    it "#find" do
      expect{find(2)}.to output("Artem Ivasenko\n").to_stdout
    end
end