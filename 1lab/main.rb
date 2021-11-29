def greeting()

    name = gets.chomp
    surname = gets.chomp
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

