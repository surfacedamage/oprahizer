class AnimationsController < ApplicationController
  def index
    @animation = Animation.load_or_create(params[:say])
  end
end
