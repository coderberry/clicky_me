require 'rubygems'
require 'uri'
require 'net/http'

module ClickyMe
  API_URL = 'http://clicky.me/app/api'
  
  def self.new(username, password, site_id=nil, sitekey_admin=nil)
    ClickyMe::Client.new(username, password, site_id, sitekey_admin)
  end
  
  class Client
    
    def initialize(username, password, site_id=nil, sitekey_admin=nil)
      @username      = username
      @password      = password
      @site_id       = site_id
      @sitekey_admin = sitekey_admin
    end
    
    def shorten(url, opts={})
      request = create_url(url, opts)
      result = get_result(request)
      return result
    end
    
    def create_url(url="", args={})
      args = args.merge({
        :username => @username, 
        :password => @password,
        :url => url
      })
      args.merge({ :site_id => @site_id }) if @site_id
      args.merge({ :sitekey_admin => @sitekey_admin }) if @sitekey_admin
      url = URI.join(url, API_URL)
      url.query = args.map { |k,v| "%s=%s" % [CGI.escape(k.to_s), CGI.escape(v.to_s)] }.join("&")
      url
    end
    
    private
    
      def get_result(request)
        begin
          resp = Net::HTTP.get(request)
          if resp =~ /http:\/\/clicky\.me\/.*/
            result = { 
              'url' => resp.strip, 
              'errorMessage' => nil, 
              'statusCode' => 'OK'
            }
          else
            result = {
              'url' => nil, 
              'errorMessage' => resp.strip, 
              'statusCode' => 'ERROR'
            }
          end
        rescue => ex
          result = {
            'url' => nil,
            'errorMessage' => ex.message, 
            'statusCode' => 'ERROR'
          }
        end
        result
      end
    
  end
  
end
