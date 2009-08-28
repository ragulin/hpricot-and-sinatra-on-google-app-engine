require 'rubygems'
require 'sinatra'
require 'open-uri'
require 'hpricot'

require 'java'

get '/' do
  "Hello from Sinatra running on Java!"

  doc = Hpricot(open('http://athega.se'))

end

