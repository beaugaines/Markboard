require 'test_helper'

class PageTest < ActiveSupport::TestCase
  
  ### Validation
  test "save page without a title" do
  	page = Page.new
  	assert !page.save
  end

  test "error message for blank title" do
    page = Page.new
    page.save
    assert page.errors[:title].include?("can't be blank")
  end

  test "title longer than 100 chars" do
    page = Page.new
    title = "A very long title!!!"
    page.title = title + title + title + title + title + "!"
    assert !page.save
  end

  test "error message for too long title" do
    page = Page.new
    title = "A very long title!!!"
    page.title = title + title + title + title + title + "!"
    page.save
    assert page.errors[:title].include?("is too long")
  end

  test "save with content" do
    page = Page.new
    page.title = "My important pageument"
    page.content = "This is some content"

    assert page.save
  end

  # This one is weired
  test "content longer than 100000 chars" do
    page = Page.new
    content = "01234567890123456789012345678901234567890123456789012345678901234567890123456789"
    lol = ""
    
    1250.times do
      lol = lol + content
    end

    page.content = lol + "!"

    assert page.invalid?
  end

  test "error message for too long content" do
    page = Page.new
    
    content = "01234567890123456789012345678901234567890123456789012345678901234567890123456789"
    lol = ""
    
    1250.times do
      lol = lol + content
    end

    page.content = lol + "!"

    page.save
    
    assert page.errors[:content].include?("is too long")
      
  end

  ### Content rendering
  test "render html of markdown content" do
    page = Page.new
    page.title = "My page"
    page.content = "This is *bongos*, indeed."

    assert_equal "<p>This is <em>bongos</em>, indeed.</p>\n", page.to_html
  end

  test "autolink urls in content" do
    page = Page.new
    page.title = "My page"
    page.content = "http://www.ab.se"

    assert_equal "<p><a href=\"http://www.ab.se\">http://www.ab.se</a></p>\n", page.to_html
  end

  test "space after headers in content" do
    page = Page.new
    page.title = "My page"

    page.content = "#Header"    
    assert_not_equal "<h1>Header</h1>\n", page.to_html

    page.content = "# Header"    
    assert_equal "<h1>Header</h1>\n", page.to_html
  end

  ### recent pages
  test "recent pages" do
    recent_pages = Page.recent_pages

    assert_equal recent_pages.first.title, "Page three"
    assert_equal recent_pages.last.title, "Page one"
  end

  ### all pages
  test "all pages" do
    all_pages = Page.all_pages

    assert_equal all_pages.first.title, "Page three"
    assert_equal all_pages.last.title, "Page one"
  end
  
end
