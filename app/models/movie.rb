class Movie < ActiveRecord::Base
    # list all movie ratings
    def self.all_ratings
        @@all_ratings =  ['G', 'PG', 'PG-13', 'R']
end
