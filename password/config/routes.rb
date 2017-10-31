Rails.application.routes.draw do
  get '/check_password' => 'password#check'
end

# http://localhost:3000/check_password?userid=joe&password=letmein
