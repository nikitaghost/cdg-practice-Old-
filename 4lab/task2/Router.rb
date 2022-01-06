require_relative 'PostsController'
require_relative 'CommentsController'

class Router

    def initialize
        @routes = {}
    end

    def main
        resources(PostsController, 'posts')
        resources(CommentsController, 'comments')
        
        loop do 
            puts 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
            choice = gets.chomp.upcase.strip

            PostsController.connection(@routes['posts']) if choise == '1'
            CommentsController.connection(@routes['comments']) if choise == '2'
            break if choise == 'Q'
        end

        puts 'Good bye!'

    end

    def resources(class, keyword)
        controller = class.new
        @routes[keyword] = {
            'GET' => {
                'index' => controller.method(:index)
                'show' => controller.method(:show)
            },
            'POST' => controller.method(:create),
            'PUT' => controller.method(:update),
            'DELETE' => controller.method(:destroy)
        }
    end

end

router = Router.new
router.init