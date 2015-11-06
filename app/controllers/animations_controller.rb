class AnimationsController < ApplicationController

  def index
    saying = say || "You win a Kleenex!"
    @title = say || "Building Your Meme Self-Esteem"
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

  def say
    CGI.unescape(params[:say])
  end

end
