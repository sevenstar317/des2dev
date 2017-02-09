class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fill: [200, 150]
  end

  version :small do
    process resize_to_fill: [350, 200]
  end

  version :standard do
    process resize_to_fill: [350, 200]
  end

  version :large do
    process resize_to_fit: [800, 800]
  end

end
