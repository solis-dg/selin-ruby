require 'selenium-webdriver'
require 'headless'

describe "Simple authentication" do
    
    before(:all) do
        @headless = Headless.new
        @headless.start
        
        @browser = Selenium::WebDriver.for :firefox
    end
    
    after(:all) do
        @browser.close
        @headless.destroy
    end
    
    it "should login" do
        @browser.navigate.to 'https://console.eu.amp.sourcefire.com'

        email = @browser.find_element(:css, 'input#email')
        email.send_keys 'demo@amp.com'

        password = @browser.find_element(:css, 'input#password')
        password.send_keys 'Fire@MP'

        @browser.find_element(:css, 'a.submit').click

        expect(@browser.title).to eq 'Dashboard'
    end
    
    it "should do nothing" do
       # ...
    end
end