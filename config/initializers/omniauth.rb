OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '698472173688287', '349342701bbfc902f2631896431b7f23'
end