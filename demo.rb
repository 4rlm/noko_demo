# http://www.infinitiofmodesto.com/
# http://www.infinitiofmodesto.com/dealership/staff.htm
#
# http://www.landroverportland.com/
# http://www.landroverportland.com/dealership/staff.htm
#
# http://www.anaheimmitsubishi.com/
# http://www.anaheimmitsubishi.com/dealership/staff.htm
#
#
#
# https://www.bmwofhumboldtbay.com/
# https://www.bmwofhumboldtbay.com/dealership/staff.htm
#################################################
require "net/http"
require "uri"
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

##############
website = 'https://www.bmwofhumboldtbay.com/dealership/staff.htm'

uri = URI(website)
net_doc = Net::HTTP.get(uri) # => String
doc = Nokogiri::HTML(net_doc)
puts "\n\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n\n"

def staff_scraper(doc)
  if doc.css('#staffList .vcard .fn')
    staff_count = doc.css('#staffList .vcard .fn').count
    staff_hash_array = []

    for i in 0..staff_count
      staff_hash = {}

      staff_hash[:full_name] = doc.css('#staffList .vcard .fn')[i] ? doc.css('#staffList .vcard .fn')[i].text.strip : ''
      staff_hash[:job] = doc.css('#staffList .vcard .title')[i] ? doc.css('#staffList .vcard .title')[i].text.strip : ''
      staff_hash[:email] = doc.css('#staffList .vcard .email')[i] ? doc.css('#staffList .vcard .email')[i].text.strip : ''
      staff_hash[:phone] = doc.css('#staffList .vcard .phone')[i] ? doc.css('#staffList .vcard .phone')[i].text.strip : ''

      # if doc.css('#staffList .vcard .fn')[i]
      #   staff_hash[:full_name] = doc.css('#staffList .vcard .fn')[i].text.strip
      # else
      #   staff_hash[:full_name] = ''
      # end
      #
      # if doc.css('#staffList .vcard .title')[i]
      #   staff_hash[:job] = doc.css('#staffList .vcard .title')[i].text.strip
      # else
      #   staff_hash[:job] = ''
      # end
      #
      # if doc.css('#staffList .vcard .email')[i]
      #   staff_hash[:email] = doc.css('#staffList .vcard .email')[i].text.strip
      # else
      #   staff_hash[:email] = ''
      # end
      #
      # if doc.css('#staffList .vcard .phone')[i]
      #   staff_hash[:phone] = doc.css('#staffList .vcard .phone')[i].text.strip
      # else
      #   staff_hash[:phone] = ''
      # end

      staff_hash_array << staff_hash
    end
    puts staff_hash_array
  end
end

staff_scraper(doc)











###############
## Page Environment
# puts doc
# puts doc.css('li/h1')[0].text
##############
# title = doc.css('title').text
# body = doc.css('body').text
# body = doc.css('body')
# body_hrefs = body.css('a')

# puts body_hrefs
# puts body


puts "\n\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n\n"
