class GameController < ApplicationController
def try
        @rand_num = (1 + rand(100)).to_i

        if cookies[:counter] == nil
            cookies[:counter] = 0
        elsif cookies[:counter].to_i >= 5
            @rand_num = (1 + rand(100)).to_i
            cookies[:number] = @rand_num
            cookies[:counter] = 0
        elsif params[:name].to_i != nil && params[:name].to_i !=0
            cookies[:counter] = cookies[:counter].to_i + 1
        elsif params[:name].to_i == 0
            cookies[:counter] = cookies[:counter].to_i

        end

        cookies[:number] = @rand_num unless cookies[:number] != nil
        @rand_result = cookies[:number].to_i

        @guess = (params[:name]).to_i
        if @guess != nil && @guess > @rand_result && cookies[:counter] < 5
            @result = "Your guess is too high."
        elsif @guess != nil && @guess < @rand_result && cookies[:counter] < 5
            @result = "Your guess is too low."
        elsif @guess != nil && @guess > @rand_result || @guess < @rand_result
            @result = "Too many guesses. You lose and everyone is ashamed of you. I'm thinking of a new number now."
        elsif @guess != nil && @guess == @rand_result
            @rand_num = (1 + rand(100)).to_i
            cookies[:number] = @rand_num
            cookies[:counter] = 0
            @result = "You have guessed correctly. You are a good person."
        end

        render "try.html.erb"
    end
end


#     def try
#         @rand_num = (1 + rand(100)).to_i
#
#         if cookies[:counter] == nil
#             cookies[:counter] = 0
#         elsif cookies[:counter].to_i >= 5
#             @rand_num = (1 + rand(100)).to_i
#             cookies[:number] = @rand_num
#             cookies[:counter] = 0
#
#         else
#             cookies[:counter] = cookies[:counter].to_i + 1
#         end
#
#         cookies[:number] = @rand_num unless cookies[:number] != nil
#         @rand_result = cookies[:number].to_i
#
#         @guess = (params[:number]).to_i
#         if @guess > @rand_result && cookies[:counter] < 5
#             @result = "Your guess is too high."
#         elsif @guess < @rand_result && cookies[:counter] < 5
#             @result = "Your guess is too low."
#         elsif @guess > @rand_result || @guess < @rand_result
#             @result = "Too many guesses. You lose. I'm thinking of a new number now."
#         elsif @guess == @rand_result
#             @rand_num = (1 + rand(100)).to_i
#             cookies[:number] = @rand_num
#             cookies[:counter] = 0
#             @result = "You have guessed correctly."
#         else
#             @result = "Invalid guess."
#         end
#
#         render "try.html.erb"
#     end
# end
