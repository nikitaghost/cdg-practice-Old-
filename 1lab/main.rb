def greeting()

    print "Enter your name: "
    name = gets.chomp
    print "Enter your surname: "
    surname = gets.chomp
    print "Enter your age: "
    age = gets.to_i

    if age < 18
        "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
    else
        "Привет, #{name} #{surname}. Самое время заняться делом!"
    end

end

def foobar(first, second)

    return first == 20 || second == 20? second : first + second

end  

# puts greeting()

# print "Enter first number: "
# first = gets.to_i
# print "Enter second number: "
# second = gets.to_i
# puts foobar(first, second)