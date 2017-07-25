require 'webmock'
include WebMock::API
WebMock.enable!

require 'webmock/rspec'
allowed_sites = lambda do |uri|
  whitelist = ['127.0.0.1', '::1', 'localhost', 'graph.facebook.com', 'scontent.xx.fbcdn.net', 'maps.googleapis.com']
  whitelist.include?(uri.host)
end
WebMock.disable_net_connect!(allow: allowed_sites)
