Rails.application.routes.draw do
  get '/try/:rand' => 'game#try'
end
