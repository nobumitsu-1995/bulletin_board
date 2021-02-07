Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_API_KEY'], ENV['TWITTER_API_SECRET'], request_path: '/auth/twitter', callback_path: '/auth/twitter/callback'
end
