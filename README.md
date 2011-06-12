# ClickyMe

Use the http://clicky.me API to shorten URLs

### Installation

    gem install clicky_me
  
### Non-tracked Usage

    require 'clicky_me'
    client = ClickyMe.new('username','password')
    results = client.shorten('http://www.google.com').url
    
    >> http://clicky.me/5arG
    
### Site-based Tracked Usage
    
    require 'clicky_me'
    require 'clicky_me'
    client = ClickyMe.new('username', 'password', 'site_id', 'sitekey_admin')
    results = client.shorten('http://www.google.com').url
    
    >> http://clicky.me/5ary
  