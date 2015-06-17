# This is a template for a Ruby scraper on morph.io (https://morph.io)
# including some code snippets below that you should find helpful

# You don't have to do things with the Mechanize or ScraperWiki libraries.
# You can use whatever gems you want: https://morph.io/documentation/ruby
# All that matters is that your final data is written to an SQLite database
# called "data.sqlite" in the current working directory which has at least a table
# called "data".

require 'scraperwiki'
require 'mechanize'

agent = Mechanize.new

# Read in a page
page = agent.get(
    uri = 'https://epathway.monash.vic.gov.au/ePathway/Production/Web/GeneralEnquiry/EnquirySummaryView.aspx',
    headers = {
      'Referer' => 'https://epathway.monash.vic.gov.au/ePathway/Production/Web/default.aspx',
      'Cookie' => 'ePathway=54F04B11E551E20DC2FDCA5A8DDE7AFBE40E7641D6617DE64529D75EE2F0E8012FAAE994740D24FD440648401764B00ADB687356382326F6A4196908F85903516BAC9F61A5C6F3AB032C23701FFCD900D07F7DE281E0709B72C118F1AD826A2AA3FC46FCB05201CC037CC8E1237444DCCF1358B376696C5F89B39840D22BF71D6DD882BDDD3E8018985F81F2BC199DA66D9DE4B01AE3F81B16AF92FB5F1227DD30F28CAB41712B66269631905F835761C01A1729305EA59E69996D700E7BD5E9EE492C485E250BED698D70E47535D142188F370D5B5C97955C1E59BEF81666D67EFCF227183B450E97541CC137BCF6C37037A786D43DC01E97EE8E018C419B20; ASP.NET_SessionId=icrmlzygogfseucnzqkhxcgl',
    })

puts 'Error:'
p page.at('#ctl00_MainBodyContent_mErrorPanel')

puts 'Content:'
p page.at('.ContentPanelHeading')

# Write out to the sqlite database using scraperwiki library
# ScraperWiki.save_sqlite(["name"], {"name" => "susan", "occupation" => "software developer"})

# An arbitrary query against the database
# ScraperWiki.select("* from data where 'name'='peter'")
