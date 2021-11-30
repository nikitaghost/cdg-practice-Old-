class ATM

    BALANCE_PATH = "balance.txt"
    DEFAULT_BALANCE = 100.0

    def initialize
        if !File.exist?(BALANCE_PATH)
            File.write(BALANCE_PATH, DEFAULT_BALANCE) 
            @balance = DEFAULT_BALANCE
        else
            @balance = File.readlines(BALANCE_PATH).first.to_f
        end
    end

    def balance
        puts "Balance is #{@balance}"
        menu()
    end
    
    def deposit()
        puts "Enter the deposit amount: "
        puts "Min 1"

        amount = gets.to_f

        if amount <= 0
            puts "The deposit amount must be greater than 0!"
            deposit()
        else
            @balance += amount
            balance()
        end
    end

    def withdraw()

        if @balance <= 0
            puts "There is no money in your account." 
            menu()
        end

        puts "Enter the withdrawal amount: "
        puts "Min 1, Max #{$balance}"

        amount = gets.to_f

        if amount > 0 && amount <= @balance
            @balance -= amount
            balance()
        else
            puts "The withdrawal amount must be greater than 0 and not more than the balance!"
            withdraw()    
        end

    end

    def menu()

        loop do

            items = ["\"D\" - Внести деньги;", "\"W\" - Вывести деньги;", "\"B\" - Проверить баланс;", "\"Q\" - Выйти;"]
    
            puts "Меню: "
            items.each {|item| puts item}

            selected_index = gets.chomp
      
            case selected_index.upcase
            when 'D'
              deposit
              break
            when 'W'
              withdraw
              break
            when 'B'
              balance
              break
            end
            break if selected_index.upcase == "Q"

            puts "Введите корректную команду!"
          
        end

        File.write(BALANCE_PATH, @balance) 
    
    end

end

atm = ATM.new
atm.menu