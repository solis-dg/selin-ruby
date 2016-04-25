require 'selenium-webdriver'
require 'headless'

headless = Headless.new
headless.start

browser = Selenium::WebDriver.for :firefox
browser.navigate.to 'https://console.eu.amp.sourcefire.com'

email = browser.find_element(:css, 'input#email')
email.send_keys 'demo@amp.com'

password = browser.find_element(:css, 'input#password')
password.send_keys 'Fire@MP'

browser.find_element(:css, 'a.submit').click

puts browser.title

browser.close
headless.destroy