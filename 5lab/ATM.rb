require 'socket'
require 'rack'
require 'rack/utils'

server = TCPServer.new('188.227.35.77', 3000)

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

    def call(value, env)
        req = Rack::Request.new(env)
        case req.path
        when '/deposit'
            answer = deposit(value)
            [answer[:code], {'Content-Type' => 'text/html'}, [answer[:text]]]
        when '/withdraw'
            answer = withdraw(value)
            [answer[:code], {'Content-Type' => 'text/html'}, [answer[:text]]]
        when '/balance'
            answer = balance()
            [answer[:code], {'Content-Type' => 'text/html'}, [answer[:text]]]
        else
            [404, {'Content-Type' => 'text/html'}, ["Not found"]]
        end
    end

end

atm = ATM.new

while connection = server.accept
    request = connection.gets
    method, full_path = request.split(' ')
    path = full_path.split('?')[0]
    
    @value = nil
    if full_path.split('?')[1] != nil
        params = full_path.split('?')[1].split('&') if full_path.split('?')[1] != nil
        params.each do |var|
            if var.split('=')[0] == "value"
                @value = var.split('=')[1] if var.split('=')[0] == "value"
                @value = @value.to_i
            end
        end
    end

    status, headers, body = atm.call(@value, {
    'REQUEST_METHOD' => method,
    'PATH_INFO' => path,
    })

    connection.print("HTTP/1.1 #{status}\r\n")

    headers.each { |key, value|  connection.print("#{key}: #{value}\r\n") }

    connection.print "\r\n"

    body.each { |part| connection.print(part) }

    connection.close
end