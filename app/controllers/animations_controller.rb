class AnimationsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
    say = params[:say] || params[:text]
    say = CGI.unescape(say) if say
    saying = say || "You win a Kleenex!"
    @title = say || "Building Your Meme Self-Esteem"
    @animation = Animation.load_or_create(saying)

    respond_to do |format|
      format.html
      format.json { render json: slack_response(animation_url(@animation)) }
      format.gif { redirect_to animation_url(@animation) }
    end
  end

  private

  def animation_url(image)
    "#{root_url}images/#{CGI.escape(image.file_name)}"
  end
  helper_method :animation_url

  def slack_response(image_url)
    {
      response_type: 'in_channel',
      attachments: [
        fallback: image_url,
        image_url: image_url
      ]
    }
  end

end
