require 'rspec'
require './3issue.rb'

RSpec.describe "3issue" do
    before(:each) {File.write("balance.txt", "100.0", mode:"w")}

    it '#deposit' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('d', 100, "q\n")
      expect{menu}.to output("Меню: \n\"D\" - Внести деньги;\n\"W\" - Вывести деньги;\n\"B\" - Проверить баланс;\n\"Q\" - Выйти;\nВведите сумму депозита: \nМинимум 1\nБаланс: 200.0\nМеню: \n\"D\" - Внести деньги;\n\"W\" - Вывести деньги;\n\"B\" - Проверить баланс;\n\"Q\" - Выйти;\n").to_stdout
    end

    it '#deposit with mistake' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("d", -100, 100, "q\n")
      expect{menu}.to output("Меню: \n\"D\" - Внести деньги;\n\"W\" - Вывести деньги;\n\"B\" - Проверить баланс;\n\"Q\" - Выйти;\nВведите сумму депозита: \nМинимум 1\nСумма депозита должна быть больше 0!\nВведите сумму депозита: \nМинимум 1\nБаланс: 300.0\nМеню: \n\"D\" - Внести деньги;\n\"W\" - Вывести деньги;\n\"B\" - Проверить баланс;\n\"Q\" - Выйти;\n").to_stdout
    end

    it '#balance' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("b\n", "q\n")
      expect{menu}.to output("Меню: \n\"D\" - Внести деньги;\n\"W\" - Вывести деньги;\n\"B\" - Проверить баланс;\n\"Q\" - Выйти;\nБаланс: 300.0\nМеню: \n\"D\" - Внести деньги;\n\"W\" - Вывести деньги;\n\"B\" - Проверить баланс;\n\"Q\" - Выйти;\n").to_stdout
    end

    it '#quit' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("q\n")
      expect{menu}.to output("Меню: \n\"D\" - Внести деньги;\n\"W\" - Вывести деньги;\n\"B\" - Проверить баланс;\n\"Q\" - Выйти;\n").to_stdout
    end

    it '#withdraw' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("w", 100, "q\n")
      expect{menu}.to output("Меню: \n\"D\" - Внести деньги;\n\"W\" - Вывести деньги;\n\"B\" - Проверить баланс;\n\"Q\" - Выйти;\nВведите сумму вывода: \nМинимум 1, максимум 300.0\nБаланс: 200.0\nМеню: \n\"D\" - Внести деньги;\n\"W\" - Вывести деньги;\n\"B\" - Проверить баланс;\n\"Q\" - Выйти;\n").to_stdout
    end

    it '#withdraw with mistake' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("w\n", -100, 100, "q\n")
      expect{menu}.to output("Меню: \n\"D\" - Внести деньги;\n\"W\" - Вывести деньги;\n\"B\" - Проверить баланс;\n\"Q\" - Выйти;\nВведите сумму вывода: \nМинимум 1, максимум 200.0\nСумма вывода должна быть больше 0 и не больше баланса!\nВведите сумму вывода: \nМинимум 1, максимум 200.0\nБаланс: 100.0\nМеню: \n\"D\" - Внести деньги;\n\"W\" - Вывести деньги;\n\"B\" - Проверить баланс;\n\"Q\" - Выйти;\n").to_stdout
    end
  end