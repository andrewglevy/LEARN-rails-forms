class PasswordController < ApplicationController
    def check
        @user = params[:user]
        @password = params[:password]

        @is_valid = true
        if @user != nil && @password !=nil
            if @user.include?("!") || @user.include?("#") || @user.include?("@")
                @is_valid = false
                flash.now[:alert] = "Username cannot contain the following characters: ! # @"
            elsif @user.length < 6
                @is_valid = false
                flash.now[:alert] = "Username must be 6 or more characters."
            elsif !@password.include?("!") && !@password.include?("#") && !@password.include?("@")
                @is_valid = false
                flash.now[:alert] = "Password must contain at least one of the following characters: ! # @."
            elsif @password.downcase == "password"
                @is_valid = false
                flash.now[:alert] = "Password cannot be 'password,' you dolt."
            elsif @password.upcase == "PASSWORD"
                @is_valid = false
                flash.now[:alert] = "Password cannot be 'PASSWORD,' you nincompoop."
            elsif !@password.include?("0") && !@password.include?("1") && !@password.include?("2") && !@password.include?("3") && !@password.include?("4") && !@password.include?("5") && !@password.include?("6") && !@password.include?("7") && !@password.include?("8") && !@password.include?("9")
                @is_valid = false
                flash.now[:alert] = "Password must contain at least one number."
            elsif @password.length < 6
                @is_valid = false
                flash.now[:alert] = "Password must be 6 or more characters."
            elsif @password == @password.upcase
                @is_valid = false
                flash.now[:alert] = "Password must contain at least one lowercase letter."
            elsif @password == @password.downcase
                @is_valid = false
                flash.now[:alert] = "Password must contain at least one uppercase letter."
            elsif @user == @password
                @is_valid = false
                flash.now[:alert] = "Username and password cannot be the same."
            elsif @user != nil && @password != nil
                flash.now[:notice] = "Your credentials are acceptable."
            end
        end
    end
end
