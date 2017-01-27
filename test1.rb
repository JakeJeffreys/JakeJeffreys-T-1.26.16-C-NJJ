require 'rubygems'
require 'watir'
require 'test/unit'

class TestClass < Test::Unit::TestCase
  def setup
    @browser = Watir::Browser.new :chrome
    @browser.goto "http://bbc.com/news"
    @browser.text_field(:name => "q").set "World Market\n"
  end

  def teardown
    @browser.close
  end

  #  def testcase_one
  #    results = @browser.ol(:xpath => "//*[@id='search-content']/ol[1]").lis.length
  #    assert results == 10
  #  end
  #
  # def testcase_two
  #   @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
  #   @browser.ol(:xpath => "//*[@id='search-content']/ol[2]").wait_until_present
  #   results = @browser.ol(:xpath => "//*[@id='search-content']/ol[2]").lis.length
  #   assert results == 10
  # end
  #
  # def testcase_three
  #   for i in 1..2
  #     @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
  #     @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
  #   end
  #   results = @browser.ol(:xpath => "//*[@id='search-content']/ol[2]").lis.length
  #   assert results == 10
  # end
  #
  # def testcase_four
  #   for i in 1..3
  #     @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
  #     @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
  #   end
  #   results = @browser.ol(:xpath => "//*[@id='search-content']/ol[3]").lis.length
  #   assert results == 10
  # end
  #
  # def testcase_five
  #   for i in 1..4
  #     @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
  #     @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
  #   end
  #   results = @browser.ol(:xpath => "//*[@id='search-content']/ol[4]").lis.length
  #   assert results == 10
  # end
  #
  # def testcase_six
  #   for i in 1..5
  #     @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
  #     @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
  #   end
  #   results = @browser.ol(:xpath => "//*[@id='search-content']/ol[5]").lis.length
  #   assert results == 10
  # end
  #
  # def testcase_seven
  #   for i in 1..6
  #     @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
  #     @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
  #   end
  #   results = @browser.ol(:xpath => "//*[@id='search-content']/ol[6]").lis.length
  #   assert results == 10
  # end
  #
  # def testcase_eight
  #   for i in 1..7
  #     @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
  #     @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
  #   end
  #   results = @browser.ol(:xpath => "//*[@id='search-content']/ol[7]").lis.length
  #   assert results == 10
  # end
  #
  # def testcase_nine
  #   for i in 1..8
  #     @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
  #     @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
  #   end
  #   results = @browser.ol(:xpath => "//*[@id='search-content']/ol[8]").lis.length
  #   assert results == 10
  # end
  #
  # def testcase_ten
  #   for i in 1..9
  #     @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
  #     @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
  #   end
  #   results = @browser.ol(:xpath => "//*[@id='search-content']/ol[9]").lis.length
  #   assert results == 10
  # end

  def testcase_eleven
    for i in 1..10
      @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
      @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
    end
    results = @browser.ol(:xpath => "//*[@id='search-content']/ol[10]").lis.length
    assert results == 10

    num = 0
    for j in 1..100
      string = @browser.element(:xpath => "//*[@id='search-content']/ol[15]/li[#{i}]/article/div/h1/a").text
      if string.include? "london market report"
        num += 1
      end
    end

    puts "The Search Term of 'World Market' contains #{num} references to articles relating to the 'London market report'. "
  end




end



# require "selenium-webdriver"
# require "watir-webdriver"
# require 'test/unit'
# driver = Selenium::WebDriver.for :chrome
# browser = Watir::Browser.new(driver)
#
# browser.driver.manage.timeouts.page_load = 10
#
# browser.goto("http://www.bbc.com")
#
# class TC_mytest < Test::Unit::TestCase
#
#   def test_zero
#     assert(1 == 1)
#   end
#
#   def first_test
#     browser.text_field(:id => "orb-search-q").set("World Market")
#     p browser.current_url
#     assert(browser.current_url == "www.bbc.com")
#   end
#
# end

# browser.find_element(name: "q").send_keys "book"
# browser.find_element(name: "btnG").click
# p browser.find_elements(tag_name: "img").size
# browser.close
