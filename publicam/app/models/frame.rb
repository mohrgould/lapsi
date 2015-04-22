class Frame < ActiveRecord::Base
  belongs_to :camera
  attr_accessor :image
  before_save :persist_file

  def at
    Time.at(ts.to_i)
  end

  def url
    return File.join('/images', 'frames', subpath)
  end

  def thumb_url
    return File.join('frames', 'thumbs', subpath)
  end

private

  def subpath
    return File.join(camera.name, 
                     at.year.to_s.rjust(4, '0'),
                     at.month.to_s.rjust(2, '0'),
                     at.day.to_s.rjust(2, '0'),
                     at.hour.to_s.rjust(2, '0'),
                     "#{at.to_i}.jpg")
  end

  def localroot
    return Rails.root.join('public', 'images', 'frames')
  end

  def localpath
    return Rails.root.join(localroot, subpath)
  end

  def thumbspath
    return File.join(localroot, 'thumbs', subpath)
  end

  def persist_file
    if image.present?
      FileUtils.mkdir_p File.dirname(localpath)
      File.open(Rails.root.join(localpath), 'wb') do |file|
        file.write(image.read)
      end
      FileUtils.mkdir_p File.dirname(thumbspath)
      FastImage.resize(localpath, 320, 240, outfile: thumbspath)
    end
  end
end
