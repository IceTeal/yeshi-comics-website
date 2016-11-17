class PagesController < ApplicationController
  def about_us
  	@page = Page.where(:name => 'About Us')
  end

  def contact
  	@page = Page.where(:name => 'Contact Us')
  end
end
