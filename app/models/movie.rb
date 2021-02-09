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
    
    # show movies based on sort list and ratings
    def self.get_movies(params, ratings_list)
        if params.has_key?(:sort) && params[:sort] != nil && params[:sort] > "" then
            if ratings_list.length() > 0 then
                return self.where(rating: ratings_list).order(params[:sort])
            else
                return self.order(params[:sort])
            end
        else
            if ratings_list.length() > 0 then
                return self.where(rating: ratings_list)
            else
                return self.all
            end
        end
    end

end