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

page = agent.get('https://epathway.monash.vic.gov.au/ePathway/Production/Web/Default.aspx')
page.click('planning applications that we are currently advertising') # Can't access page directly, need to follow link.

puts 'Error:'
p page.at('#ctl00_MainBodyContent_mErrorPanel')

puts 'Content:'
p page.at('.ContentPanelHeading')

# Write out to the sqlite database using scraperwiki library
# ScraperWiki.save_sqlite(["name"], {"name" => "susan", "occupation" => "software developer"})

# An arbitrary query against the database
# ScraperWiki.select("* from data where 'name'='peter'")
