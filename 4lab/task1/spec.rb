require 'rspec'
require_relative 'CashMachine'

RSpec.describe CashMachine do
    
    it '#start balance' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('b', 'q')
      expect { subject.menu }.to output("Меню: \n\"D\" - Внести деньги;\n\"W\" - Вывести деньги;\n\"B\" - Проверить баланс;\n\"Q\" - Выйти;\nБаланс: 100.0\nМеню: \n\"D\" - Внести деньги;\n\"W\" - Вывести деньги;\n\"B\" - Проверить баланс;\n\"Q\" - Выйти;\n").to_stdout
    end

    it '#deposit' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('d', 100, 'q')
      expect (subject.menu)
      expect(File.read('balance.txt')).to eql('200.0')
    end

    it '#withdraw' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('w', 100, 'q')
      expect (subject.menu)
      expect(File.read('balance.txt')).to eql('100.0')
    end
  end