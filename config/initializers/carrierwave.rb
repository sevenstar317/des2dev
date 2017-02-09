CarrierWave.configure do |config|
  config.fog_credentials = {
    # Configuration for Amazon S3
    :provider              => 'AWS',
    :aws_access_key_id     => 'AKIAI364TECC75IVXFYQ',
    :aws_secret_access_key => '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',
    :region                => 'us-west-2'
  }

  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_directory  = 'desing2developer'
  config.fog_public     = false
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  config.storage = Rails.env.production? ? :fog : :file
end
