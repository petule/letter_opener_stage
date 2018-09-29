Rails.application.routes.draw do
  get '/letter_opener', to: 'letters#index', as: 'letter_opener_letters'
  get '/letter_opener/:id/:style.html', to: 'letters#show', as: 'letter_opener_letter'
  delete '/letter_opener/:id' => 'letters#delete', as: 'delete_letter_opener_letter'
end
