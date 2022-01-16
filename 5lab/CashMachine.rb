class CashMachine

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
        @answ = {"code": 200, "text": "#{@balance}"}
    end
    
    def deposit(amount)
        if amount == nil 
            @answ = {"code": 406, "text": "Value is empty!"}
        elsif amount <= 0
            @answ = {"code": 406, "text": "The deposit amount must be greater than 0!"}
        else
            @balance += amount
            File.write(BALANCE_PATH, @balance) 

            @answ = {"code": 200, "text": "#{@balance}"}
        end

        @answ
    end

    def withdraw(amount)
        if amount == nil 
            @answ = {"code": 406, "text": "Value is empty!"}
        elsif @balance <= 0
            @answ = {"code": 406, "text": "There is no money in your account."}
        elsif amount > 0 && amount <= @balance
            @balance -= amount
            File.write(BALANCE_PATH, @balance) 

            @answ = {"code": 200, "text": "#{@balance}"}
        else
            @answ = {"code": 406, "text": "The withdrawal amount must be greater than 0 and not more than the balance!"}
        end

        @answ

    end

    def call(map, env)
        req = Rack::Request.new(env)
        case req.path
        when '/deposit'
            if (map.include?("value"))
                answer = deposit(map["value"].to_i)
                [answer[:code], {'Content-Type' => 'text/html'}, [answer[:text]]]
            end
        when '/withdraw'
            if (map.include?("value"))
                answer = withdraw(map["value"].to_i)
                [answer[:code], {'Content-Type' => 'text/html'}, [answer[:text]]]
            end
        when '/balance'
            answer = balance()
            [answer[:code], {'Content-Type' => 'text/html'}, [answer[:text]]]
        else
            [404, {'Content-Type' => 'text/html'}, ["Not found"]]
        end
    end

end