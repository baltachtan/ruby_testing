require 'test/unit'
require 'selenium-webdriver'

class SiteElement < Test::Unit::TestCase

  def setup
    @driver=Selenium::WebDriver.for :firefox
    @driver.manage.window.maximize
    @driver.navigate.to "https://github.com"

  end

  def test_login
    wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
    wait.until {@driver.find_element(:link_text => "Marketplace")}
    @driver.find_element(:link_text => "Marketplace").click


    wait.until {@driver.find_elements(:xpath => "//*[contains(text(), 'GitHub Marketplace')]")}
    text = @driver.find_elements(:xpath => "//*[contains(text(), 'GitHub Marketplace')]")
    assert_equal(true,text[0].displayed?, "text is displayed")

  end




  def teardown()
    @driver.quit
  end
end
