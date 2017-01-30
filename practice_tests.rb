require 'rubygems'
require 'watir'
require 'test/unit'

$my_argv = ARGV.dup

class TestClass < Test::Unit::TestCase
  def setup
    if $my_argv.any?
      my_browser = $my_argv[0]
      if my_browser.downcase.include? 'firefox'
          @browser = Watir::Browser.new :ff
      else  #default is chrome
          @browser = Watir::Browser.new :chrome
      end
    else
      @browser = Watir::Browser.new :chrome
    end
    @browser.goto "http://bbc.com/news"
    @browser.text_field(:name => "q").set "World Market"
    @browser.send_keys :enter
  end

  def teardown
    @browser.close
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

  def testcase_eleven
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
        puts "Page #{list} has #{num} results."
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
