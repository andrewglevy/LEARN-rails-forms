class GameController < ApplicationController
    def try
        @random = (rand()*100).to_i
        @count = 0
        cookies[:random] = @random

        if cookies[:count].to_i < 3
            # tries count tracker
            if params[:userinput].to_i < cookies[:random].to_i
                @result = "Guess heigher"
            elsif params[:userinput].to_i > cookies[:random].to_i
                @result = "Guess lower"
            elsif params[:userinput].to_i == cookies[:random].to_i
                @result = "Correct! You guessed the number!"
            end
            cookies[:count] = cookies[:count].to_i + 1
        else
            @result = "Too many guesses. You lose. I'm thinking of a new number now."
            cookies[:count] = 0
            cookies[:random] = @random
        end
    end
    # def try
    #     @rand_num = rand(10).to_i
    #     cookies[:random] = @rand_num unless !cookies[:random].nil?
    #     cookies[:guess] = 0 if cookies[:guess].to_i == 3
    #
    #     if params[:rand].to_i == cookies[:random].to_i
    #         @result = "Correct! You guessed the number!"
    #         @rand_num = (rand(10)).to_i
    #         cookies[:random] = @rand_num
    #     elsif cookies[:guess].to_i > 3 && (params[:rand].to_i > @rand_num || params[:rand].to_i < @rand_result)
    #         @result = "Too many guesses. You lose. I'm thinking of a new number now."
    #         @rand_num = rand(10).to_i
    #         cookies[:random] = @rand_num unless !cookies[:random].nil?
    #     else
    #         @result = "Sorry! Guess again!"
    #         cookies[:guess] = cookies[:guess].to_i + 1
    #         cookies[:random] = rand(10).to_i
    #     end
    #
    #     p params[:rand]
    #     p cookies[:random]
    #     p params[:rand].to_i == cookies[:random]
    #
    #     render "try.html.erb" # Rails magic without this
    # end
end
