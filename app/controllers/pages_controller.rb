class PagesController < ApplicationController
  def home
    @title = '_Home_'
    @pg_name = 'Home'
  end

  def contact
    @title = '_Contact_'
    @pg_name = 'Contact'
  end
  
  def about
    @title = '_About_'
    @pg_name = 'About'
  end
  
end
