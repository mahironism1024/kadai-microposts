unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['AWS_REGION'],
    }

    config.fog_directory = ENV['AWS_S3_BUCKET']
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } 
    config.cache_storage = :fog
  end
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
end