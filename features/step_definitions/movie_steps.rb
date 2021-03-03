# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
  # fail "Unimplemented"
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  # using regexp, make sure that e1 occurs before e2 in page.body
  str_exp = /#{e1}.*#{e2}/m
  expect(page.body).to match(str_exp)
  # fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list| #uncheck = nil if (un)? is false
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(/, \s*/).each {|rating| #, one or more spaces characters
    if uncheck
      uncheck("ratings_#{rating}") # checkboxes id = ratings_G
    else
      check("ratings_#{rating}")    # use #{} to evauluate variable as string
    end
  }
  # fail "Unimplemented"
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  # use page from capybara and expect from rspec
  # contains css element table#movies tbody tr and checks whether tr occurs a number of times
  expect(page).to have_css('table#movies tbody tr', count: Movie.count)
  # fail "Unimplemented"
end