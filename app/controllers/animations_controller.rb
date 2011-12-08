class AnimationsController < ApplicationController
  def index
    @animation = Animation.create(params[:say])
  end
end
