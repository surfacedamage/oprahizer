Oprahize::Application.routes.draw do
  match 'oprah/:say' => 'animations#index'
end
