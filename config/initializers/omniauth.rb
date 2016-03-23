Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['553468924826589'], ENV['ba2ffaa27db038c1160d7c7fb52fae']
end
