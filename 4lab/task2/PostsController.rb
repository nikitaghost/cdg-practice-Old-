load 'Resource.rb'

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    @posts.each.with_index do |post, index|
      puts "id:#{index} \n\"#{post}\""
    end
  end

  def show
    print "Enter index of post: "
    id = gets.to_i

    if id >= @posts.length || id < 0
      puts "Incorrect Id! Error: \"Out of bounds\"."
      return 
    end

    puts "id:#{id} | \"#{@posts[id]}\""
  end

  def create
    print "Enter text of post: "
    post = gets.chomp
    
    @posts << post

    puts "Your post: #{post}\nindex: #{@posts.find_index(post)} has been created!"
  end

  def update
    print "Enter index of post: "
    id = gets.to_i

    if id >= @posts.length || id < 0
      puts "Incorrect Id! Error: \"Out of bounds\"."
      return 
    end

    print "Old post \"#{@posts[id]}\" enter new post text"
    new_post = gets.chomp

    @posts[id] = new_post
    index
  end

  def destroy
    print "Enter index of post: "
    id = gets.to_i

    if id >= @posts.length || id < 0
      puts "Incorrect Id! Error: \"Out of bounds\"."
      return 
    end

    @posts.delete_at(id)
  end
end