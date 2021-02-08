class Movie < ActiveRecord::Base
    # list all movie ratings
    def self.all_ratings
        @@all_ratings =  ['G', 'PG', 'PG-13', 'R']
    end
    
    # show movies with certain ratings
    def self.with_ratings(ratings_list)
        # if ratings_list is an array such as ['G', 'PG', 'R'], retrieve all
        #  movies with those ratings
        # if ratings_list is nil, retrieve ALL movies
        if ratings_list.length() == 0 then
            return self.all
        else
            # self.find_all_by_rating
            return self.where(rating: ratings_list)
        end
    end
end
