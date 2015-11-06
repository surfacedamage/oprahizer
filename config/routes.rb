Oprahize::Application.routes.draw do
  match 'win'   => 'animations#index'
  match '/:say' => 'animations#index'
  match '/images/:say'=> 'animations#index'
  root :to      => 'animations#index'
end
