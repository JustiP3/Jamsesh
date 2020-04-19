module BandsHelper
    def band_location(band)
        if band.location.size > 0
            "Band Location: " + band.location 
        else 
            "Band Location: Not specified"
        end    
    end 

    def member_info(user)
        string = user.username
        if user.instrument.size > 0
            string << " - " + user.instrument
        end 
        string 
    end 
end
