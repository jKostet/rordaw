Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['28fe3031cad89225be02'], ENV['e4d8ce1030675528b46699f7e4fbd9c527097964
']
end