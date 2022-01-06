load 'Resource.rb'

class CommentsController
  extend Resource

  def initialize
    @comments = []
  end

  def index
    @comments.each.with_index do |comment, index|
        puts "id:#{index} \n\"#{comment}\""
    end
  end

  def show
    print "Enter index of comment: "
    id = gets.to_i

    if id >= @comments.length || id < 0
        puts "Incorrect Id! Error: \"Out of bounds\"."
        return 
    end

    puts "id:#{id} | \"#{@comments[id]}\""
  end

  def create
    print "Enter text of comment: "
    comment = gets.chomp

    @comments << comment

    puts "Your comment: #{comment}\nindex: #{@comments.find_index(comment)} has been created!"
  end

  def update
    print "Enter index of comment: "
    id = gets.to_i

    if id >= @comments.length || id < 0
        puts "Incorrect Id! Error: \"Out of bounds\"."
        return 
      end

    print "Old comment \"#{@comments[id]}\" enter new comment "
    new_comment = gets.chomp

    @comments[id] = new_comment
    index
  end

  def destroy
    print "Enter index of comment: "
    id = gets.to_i

    if id >= @comments.length || id < 0
        puts "Incorrect Id! Error: \"Out of bounds\"."
        return 
    end

    @comments.delete_at(id)
  end

end