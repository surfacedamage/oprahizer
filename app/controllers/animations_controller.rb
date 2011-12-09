class AnimationsController < ApplicationController
  def index
    saying = params[:say] || "You win a Kleenex!"
    @title = params[:say] || "Building Your Meme Self-Esteem"
    @animation = Animation.load_or_create(saying)
  end
end
