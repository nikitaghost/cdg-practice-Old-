require "rspec"

$usersPath = "users.txt"
$buffer = "buffer.txt"
$resultsPath = "results.txt"

def index()
    File.foreach($usersPath) { |user| puts user }
end

def find(id)
    File.foreach($usersPath).with_index do |user, index|
        @text = user if (index == id)
    end

    @text
end

def where(pattern)
    File.foreach($usersPath).with_index do |user, index|
        @user_id = index if user.include?(pattern)   
    end
    
    @user_id
end

def update(id, text)
    file = File.open($buffer, 'w')
    File.foreach($usersPath).with_index do |user, index|
        file.puts(id == index ? text : user)
    end

    file.close
    File.write($usersPath, File.read($buffer))

    File.delete($buffer) if File.exist?($buffer)

end

def delete(id)
    
    file = File.open($buffer, 'w')
    File.foreach($usersPath).with_index do |str, index|
        file.puts(id == index ? "" : str)
    end

    file.close
    File.write($usersPath, File.read($buffer))

    File.delete($buffer) if File.exist?($buffer)

end

puts (find(4))
delete(4)