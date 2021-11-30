STUDENTS_PATH = "students.txt"
RESULTS_PATH = "results.txt"

def main 
    input_file = File.open(STUDENTS_PATH)
    students = input_file.readlines.map(&:chomp)   
    output_file = File.open(RESULTS_PATH, "a")

    loop do 

        break if students.size == 0

        puts 'Enter age of student'
        input_age = gets.to_i 
        
        if input_age == -1
            puts 'You entered -1'
            break
        end

        for student in students
            if student.include?(input_age.to_s)
                File.write(RESULTS_PATH, "#{student}\n", mode:"a")
                students.delete(student)
            end
        end
    end

    input_file.close
    output_file.close

    File.foreach(RESULTS_PATH){ |student| puts student }
end

# main()