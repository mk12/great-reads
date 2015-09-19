OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    '429770528034-4luoup6glpniq34addrt2o6h6ihsm462.apps.googleusercontent.com',
    'DoJpMOjSKrahLdsyTwh1pkwm'
end
