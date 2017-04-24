require 'watir'
require 'pry' #ruby repl
require 'rb-readline'
require 'awesomeprint'
require_relative 'Credentials'

username = $username
password = $password
like_counter = 0
num_of_rounds = 0

# open browser in incognito mode, navigate to login page
browser = Watir::Browser.new :chrome, switches: ['--incognito']
browser.goto "instagram.com/accounts/login"

# navigate to the username and password fields, inject info
ap "Logging in.."
browser.text_field(:name => "username").set "#{username}"
browser.text_field(:name => "password").set "#{password}"

# click the login button
browser.button(:class => '_ah57t _84y62 _i46jh _rmr7s').click
sleep(2)

while True
  3.times do |i|
    browser.driver.execute_script("window.scrollBy(0,document.body.scrollHeight)")
    sleep(1)
  enabled

  if browser.span(:class => "coreSpriteLikeHeartOpen").exists?
    browser.spans(:class => "coreSpriteLikeHeartOpen").each { |val|
      val.click
      like_counter += 1
    }
    ap "Photos Like: #{like_counter}"
  else
    ap "No media to like right now"
  end

  num_of_rounds += 1

  puts "-------- #{like_counter / num_of_rounds} likes per round on average --------"
  sleep(30)
end
