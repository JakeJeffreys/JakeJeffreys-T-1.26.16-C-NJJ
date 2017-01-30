require 'rubygems'
require 'watir'
require 'test/unit'


# Reads command line arguments
$my_argv = ARGV.dup
$my_argv.each { |arg|
  if arg.downcase.include? 'chrome'
      $b = 'chrome'
  elsif arg.downcase.include? 'firefox'
      $b = 'firefox'
  end
}


class TestClass < Test::Unit::TestCase

  # Runs before every test
  def setup
    $b = 'chrome' if $b.nil?

    if $b == 'chrome'
      @browser = Watir::Browser.new :chrome
    elsif $b == 'firefox'
      @browser = Watir::Browser.new :ff
    end

    @browser.goto "http://bbc.com/news"
    @browser.text_field(:name => "q").set "World Market"
    @browser.send_keys :enter
  end

  # Runs after every test
  def teardown
    @browser.close
    if $headless
      $headless.destroy
    end
  end


   def testcase_one
     results = @browser.ol(:xpath => "//*[@id='search-content']/ol[1]").lis.length
     assert results == 10
   end

  def testcase_two
    @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
    @browser.ol(:xpath => "//*[@id='search-content']/ol[2]").wait_until_present
    results = @browser.ol(:xpath => "//*[@id='search-content']/ol[2]").lis.length
    assert results == 10
  end

  def testcase_three
    for i in 1..2
      @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
      @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
    end
    results = @browser.ol(:xpath => "//*[@id='search-content']/ol[2]").lis.length
    assert results == 10
  end

  def testcase_four
    for i in 1..3
      @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
      @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
    end
    results = @browser.ol(:xpath => "//*[@id='search-content']/ol[3]").lis.length
    assert results == 10
  end

  def testcase_five
    for i in 1..4
      @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
      @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
    end
    results = @browser.ol(:xpath => "//*[@id='search-content']/ol[4]").lis.length
    assert results == 10
  end

  def testcase_six
    for i in 1..5
      @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
      @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
    end
    results = @browser.ol(:xpath => "//*[@id='search-content']/ol[5]").lis.length
    assert results == 10
  end

  def testcase_seven
    for i in 1..6
      @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
      @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
    end
    results = @browser.ol(:xpath => "//*[@id='search-content']/ol[6]").lis.length
    assert results == 10
  end

  def testcase_eight
    for i in 1..7
      @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
      @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
    end
    results = @browser.ol(:xpath => "//*[@id='search-content']/ol[7]").lis.length
    assert results == 10
  end

  def testcase_nine
    for i in 1..8
      @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
      @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
    end
    results = @browser.ol(:xpath => "//*[@id='search-content']/ol[8]").lis.length
    assert results == 10
  end

  def testcase_ten
    for i in 1..9
      @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
      @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
    end
    results = @browser.ol(:xpath => "//*[@id='search-content']/ol[9]").lis.length
    assert results == 10
  end

  def ztestcase_eleven
    for i in 1..10
      @browser.element(:xpath => "//*[@id='search-content']/nav[1]/a").click
      @browser.ol(:xpath => "//*[@id='search-content']/ol[#{i}]").wait_until_present
    end
    results = @browser.ol(:xpath => "//*[@id='search-content']/ol[10]").lis.length
    assert results == 10

    num = 0
    list = 1
    article = 1
    for j in 0..99
      if j%10==0 and j!=0 #increment list
        list += 1
        article = 1
      end
      string = @browser.element(:xpath => "//*[@id='search-content']/ol[#{list}]/li[#{article}]/article/div/h1/a").text
      if string.downcase.include? "london market report"
        num += 1
      end
      article += 1
    end

    puts "The Search Term of 'World Market' contains #{num} references to articles relating to the 'London market report'. "
  end



end
