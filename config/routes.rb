Oprahize::Application.routes.draw do
  match '/:say' => 'animations#index'
  root :to      => 'animations#index'
end
