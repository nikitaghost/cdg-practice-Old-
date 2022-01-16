require 'socket'
require 'rack'
require 'rack/utils'
require_relative 'CashMachine'

def call(map, env)
    req = Rack::Request.new(env)
    case req.path
    when '/deposit'
        if (map.include?("value"))
            answer = @cashMachine.deposit(map["value"].to_i)
            [answer[:code], {'Content-Type' => 'text/html'}, [answer[:text]]]
        else
            [401, { "Content-Type" => "text/html" }, ["Enter value for deposit"]]
        end
    when '/withdraw'
        if (map.include?("value"))
            answer = @cashMachine.withdraw(map["value"].to_i)
            [answer[:code], {'Content-Type' => 'text/html'}, [answer[:text]]]
        else
            [401, { "Content-Type" => "text/html" }, ["Enter value for withdraw"]]
        end
    when '/balance'
        answer = @cashMachine.balance()
        [answer[:code], {'Content-Type' => 'text/html'}, [answer[:text]]]
    else
        [404, {'Content-Type' => 'text/html'}, ["Not found"]]
    end
end

def main

    server = TCPServer.new('188.227.35.77', 3000)

    @cashMachine = CashMachine.new

    while connection = server.accept
        request = connection.gets
        method, full_path = request.split(' ')
        path = full_path.split('?')[0]

        @map = Hash.new
        if full_path.split('?')[1] != nil
            values = full_path.split('?')[1].split('&')
            values.each do |value|
                temp = value.split('=')
                @map[temp[0]] = temp[1]
            end
        end
        
        status, headers, body = call(@map, {
        'REQUEST_METHOD' => method,
        'PATH_INFO' => path,
        })

        connection.print("HTTP/1.1 #{status}\r\n")

        headers.each { |key, value|  connection.print("#{key}: #{value}\r\n") }

        connection.print "\r\n"

        body.each { |part| connection.print(part) }

        connection.close
    end

end

main()