Rails.application.routes.draw do
  get '/letter_opener/:type', to: 'letters#index', as: 'letter_opener_letters'
  get '/letter_opener/:type/:id/:style.html', to: 'letters#show', as: 'letter_opener_letter'
  delete '/letter_opener/:type/:id' => 'letters#delete', as: 'delete_letter_opener_letter'
end
