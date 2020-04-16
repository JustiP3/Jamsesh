Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, 'github key', 'github sec'
end 