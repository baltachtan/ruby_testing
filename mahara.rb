require 'test/unit'
require 'selenium-webdriver'

class MyTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup

    #define driver for firefox webdriver
    @driver=Selenium::WebDriver.for :firefox
    #maximize the window
    @driver.manage.window.maximize

    #navigate to the test site
    @driver.navigate.to "http://demo.mahara.org"
  end

  def test_login
    #define username field element
    loginUserName=@driver.find_element(:id,'login_login_username')
    #input user name
    loginUserName.send_keys('Student2')

    #define password field element
    loginPassword=@driver.find_element(:id,'login_login_password')
    #input password
    loginPassword.send_keys('Testing1')

    #define submit button element
    loginSubmitButton=@driver.find_element(:id,'login_submit')
    #click on submit button
    loginSubmitButton.click

    #wait until the Logout link displays, timeout in 10 seconds
    wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
    wait.until {@driver.find_element(:link_text => "Logout") }

    #define logout link
    logoutLink=@driver.find_element(:link_text,'Logout')
    #if logout link is displayed
    isLogoutLinkDisplayed=logoutLink.displayed?

    puts isLogoutLinkDisplayed

    #do assertion on logout link
    assert_equal(true,isLogoutLinkDisplayed,'logout button display')

  end

  def teardown
    #quit the driver
    @driver.quit
  end


end
