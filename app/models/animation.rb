require 'RMagick'

class Animation
  include Magick

  IMAGES_PATH      = 'public/images/oprahs.bees.gif/*.gif'
  ANNOTATED_FRAMES = [1,2,3,4,5,12,13,14,15,50,51,52,53,54,70,71,72,73]

  attr_reader :text, :frames

  def initialize(text)
    @text = text
  end

  def self.load_or_create(text)
    image = self.new(text)
    image.animate unless image.exists?
    image
  end

  def frames
    @frames ||= ImageList.new(*images)
  end

  def animate
    annotate_frames
    frames.delay      = 12
    frames.format     = 'gif'
    frames.iterations = 0
    frames.write(file_path)
  end

  def file_name
    "#{text}.gif"
  end

  def file_path
    "public/images/#{file_name}"
  end

  def exists?
    File.exists?(file_path)
  end

  private

    def images
      Dir[IMAGES_PATH].sort
    end

    def annotate_frames
      ANNOTATED_FRAMES.each do |index|
        next unless frames[index]
        frames[index] = annotate(frames[index])
      end
    end

    def annotate(image)
      draw = Draw.new
      image.annotate(draw, 0, 0, 0, 0, text){
        draw.pointsize   = 25
        draw.gravity     = Magick::SouthGravity
        draw.stroke      = '#000000'
        draw.fill        = '#ffffff'
        draw.font_weight = Magick::BoldWeight
      }
    end
end
