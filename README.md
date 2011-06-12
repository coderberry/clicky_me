# ClickyMe

Use the http://clicky.me API to shorten URLs

## Installation

  gem install clicky_me
  
## Usage

  require 'clicky_me'
  client = ClickyMe.new('username','password')
  results = client.shorten('http://www.google.com).url
  
  >> http://clicky.me/5arG
  