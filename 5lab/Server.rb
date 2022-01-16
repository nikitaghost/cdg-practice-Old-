require 'socket'
require 'rack'
require 'rack/utils'
require_relative 'CashMachine'

def main

    server = TCPServer.new('188.227.35.77', 3000)

    cashMachine = CashMachine.new

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
        
        status, headers, body = cashMachine.call(@map, {
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