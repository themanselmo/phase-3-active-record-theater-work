class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        res = []
        self.auditions.each do |a|
           res << a.actor
        end
        res
    end

    def locations
        res = []
        self.auditions.each do |a|
           res << a.location
        end
        res
    end

    def lead 
       lead_audition = self.auditions.find_by(hired:true)
       if(lead_audition == nil) 
            "no actor has been hired for this role"
       else
            lead_audition
       end
    end 

    def understudy
        lead_auditions = self.auditions.where(hired:true)
        if lead_auditions.length < 2
            "no actor has been hired for this role"
        else
            lead_auditions[1]
        end
    end
end