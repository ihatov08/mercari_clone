class ApplicationUploader < CarrierWave::Uploader::Base
  if ENV['ENABLED_FOG']
    storage :fog
  else
    storage :file
  end
end
