class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #mms: I like the separation.  This belongs in app/controller/concerns.  app/helpers/ are really for view helpers.
  #   http://codefol.io/posts/Where-Do-I-Put-My-Code
  include SessionsHelper
end
