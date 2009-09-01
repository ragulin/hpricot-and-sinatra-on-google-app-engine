require 'rubygems'
require 'sinatra'
require 'hpricot'
require 'json'
require 'java'

get '/' do
  url = java.net.URL.new("http://athega.se")
  ruby_io = org.jruby.RubyIO.new(JRuby.runtime, url.openStream)
  io = Java.java_to_ruby(ruby_io.java_object)

  doc = Hpricot(open("http://athega.se"))
  result = doc/"//*[@id='helplist']/li/a"

  articles = result.collect do | article |
     {'title' => article.inner_html.strip,
      'link' => article.attributes['href'] }
  end
  content_type :json
  JSON.generate({'news' => articles})
end

