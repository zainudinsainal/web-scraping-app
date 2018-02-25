require 'open-uri'

class Tutorial < ApplicationRecord
  belongs_to :author

  def scrape(url)
    title_selector = '#sites-page-title'
    author_selector = '//*[@id="afterPageTitleHideDuringEdit"]/text()[3]'
    content_selector = '#sites-canvas-main-content div[dir="ltr"] *'
    published_date_selector = '#afterPageTitleHideDuringEdit span'

    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    title = doc.at_css(title_selector).content
    content = doc.css(content_selector)
    published_at = doc.at_css(published_date_selector).content;
    author_name = doc.at_xpath(author_selector).content.gsub(/[[:space:]]/, ' ').strip[3..-1]

    tutorial = Tutorial.find_by(title: title)
    unless tutorial.nil?
        self.id = tutorial.id
        @new_record = false
    end

    author = Author.find_by(name: author_name)
    author = Author.create(name: author_name) if author.nil?

    self.title = title
    self.content = content
    self.author = author
    self.published_at = published_at

    self
  end
end
