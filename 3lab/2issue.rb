require "rspec"

$usersPath = "users.txt"
$resultsPath = "results.txt"

User = Struct.new(:index, :name, :surname, :age)

def readFile(path)

    file_data = File.read(path).split("\n")

    return file_data

end

def writeToFile(path, users)

    File.write(path, "")
    for user in users do

        str = "#{user.name} #{user.surname} #{user.age}\n";
        File.write(path, str, mode: "a")

    end
end

def sortByIndex(objArray)

    return (objArray.sort_by { |objArray| [objArray.index] })

end

def createUser(counter, str)

    array = str.split(" ");

    name = array[0];
    surname = array[1];
    age = array[2];

    return User.new(counter, name, surname, age)

end

def createUsersArray(strArray)
    
    users = []

    counter = 0
    for str in strArray do
        users << createUser(counter, str)
        counter += 1
    end

    return users;

end

def setIndex(users1, users2)
    for user1 in users1 do
        for user2 in users2 do
            if (user1.name == user2.name && user1.surname == user2.surname && user1.age == user2.age)
                user2.index = user1.index
            end
        end
    end
end

def addToArray(struct, array)

    array << struct
    return array

end

def searchUserByAge(users, age)

    puts users.find {|user| user.age == age}

end

def main()

    age = nil

    loop do
        age = gets.to_i

        data = readFile($usersPath)
        usersArr = createUsersArray(data)

        data = readFile($resultsPath)
        resultsArr = createUsersArray(data)

        resultsArr = setIndex(usersArr, resultsArr)
        puts resultsArr 

        currentUser = searchUserByAge(usersArr, age)
        puts currentUser

        #puts searchUserByAge(resultsArr, age)

        if searchUserByAge(resultsArr, age) == nil

            resultsArr = addToArray(resultsArr, currentUser)
            resultsArr = sortByIndex(resultsArr)
            writeToFile($resultsPath, resultsArr)

        end

        break if age == -1
    end

puts "All done"

end

main()


