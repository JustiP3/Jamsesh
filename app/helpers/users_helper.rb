module UsersHelper
    
    def user_errors(@user)
        if @user.errors.any? 
            "Errors:"
            @user.errors.full_messages.each do |msg|
                msg
            end
        end 
    end 
end
