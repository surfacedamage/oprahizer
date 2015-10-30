class AnimationsController < ApplicationController

  def index
    saying = params[:say] || "You win a Kleenex!"
    @title = params[:say] || "Building Your Meme Self-Esteem"
    @animation = Animation.load_or_create(saying)

    respond_to do |format|
      format.html
      format.gif { redirect_to animation_url(@animation) }
    end
  end

  private

  def animation_url(image)
    "#{root_url}images/#{CGI.escape(image.file_name)}"
  end
  helper_method :animation_url

end
