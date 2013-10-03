OmniAuth.config.logger = Rails.logger 

Rails.application.config.middleware.use OmniAuth::Builder do 
  provider :facebook, '128158257370470', 'af228b2ebe2e99f7ca3c0959aff6698f'
end   

