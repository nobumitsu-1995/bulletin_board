Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_API_KEY'], ENV['TWITTER_API_SECRET']
  provider :facebook, ENV['FACEBOOK_API_ID'], ENV['FACEBOOK_API_SECRET']
  provider :google_oauth2, ENV['GOOGLE_API_ID'], ENV['GOOGLE_API_SECRET']
end
