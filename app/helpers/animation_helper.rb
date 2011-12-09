module AnimationHelper
  def animation_url(image)
    "#{root_url}images/#{image.file_name}"
  end
end
