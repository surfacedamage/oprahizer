Oprahize::Application.routes.draw do
  match '/:say' => 'animations#index'
end
