class PagesController < ApplicationController
  def home
    @title = 'Home'
    @pg_name = 'Home'
  end

  def contact
    @title = 'Contact'
    @pg_name = 'Contact'
  end
  
  def about
    @title = 'About'
    @pg_name = 'About'
  end
  
  def help
    @title = 'Help'
    @pg_name = 'Help'
  end
end
