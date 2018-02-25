require 'open-uri'

class TutorialService
  def scrape_listing
    base_url = 'http://portal.bluejack.binus.ac.id'
    listing_url = '/system/app/pages/subPages?path=/tutorials&offset='
    page_no = 0
    page_count = 50
    has_next = false

    begin
      url = base_url + listing_url + (page_no * page_count).to_s
      listing = Nokogiri::HTML(open(url))
      page_no += 1

      listing.css('.sites-table a').each do |tutorial_el|
          scrape(base_url + (tutorial_el.attr :href))
      end

      # split pagination info, e.g. from "1-50 of 54" to ["1", "50", "54"]
      pagination_info = listing.at_css('.sites-pagination-info').content.split(/ of |-/)
      has_next = pagination_info[1].to_i < pagination_info[2].to_i
    end while has_next
  end

  def scrape url
      t = Tutorial.new.scrape url

      t.save
  end
  handle_asynchronously :scrape
end