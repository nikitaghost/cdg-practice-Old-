require 'rspec'
require './main.rb'

RSpec.describe "2issue" do
  before(:each) do
    File.write(STUDENTS_PATH, "Nikita Kitaychik 19\nKirill Yaroshevich 20\nRail Gafurov 19\nRoman Isaev 17\nMkhitar Stepanyan 18")
    File.write(RESULTS_PATH, "")
  end

  it "#without negative number" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(19, 17, 20, 18)
    expect{main}.to output("Enter age of student\nEnter age of student\nEnter age of student\nEnter age of student\nNikita Kitaychik 19\nRail Gafurov 19\nRoman Isaev 17\nKirill Yaroshevich 20\nMkhitar Stepanyan 18\n").to_stdout
  end

  it "#with negative number" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(19, 17, -1)
    expect{main}.to output("Enter age of student\nEnter age of student\nEnter age of student\nYou entered -1\nNikita Kitaychik 19\nRail Gafurov 19\nRoman Isaev 17\n").to_stdout
  end

  it "#straightaway negative number" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(-1)
    expect{main}.to output("Enter age of student\nYou entered -1\n").to_stdout
  end
end