class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    #as this current_user method is defined in application controller,
    #so we can not use it in our views so to access it in our view,
    # we have declared it as a helper method now we can access it in both,
    #our views and controllers
    
    def current_user
        # if session[:user_id]
        #   user.find(session[:user_id])
        
        # antther short method to write the aboe code is
        # user.find(session[:user_id]) if session[:user_id]
        
        # on every time when will refer this method it will hit the data base
        # and that is not the efficient way to so will perform this as
        @current_user ||= User.find(session[:user_id]) if session[:user_id]      # so in above scenerio if we have already current user then it will
        # retrun it other wise will hit the data base and will return the current
        # user
    end

    def logged_in?
        # to check logged in we have to simply check the current user exist so for that
        # we have to turn user into boolean
        !!current_user
        # if it has a current user it wil return true else flase
      end
end
