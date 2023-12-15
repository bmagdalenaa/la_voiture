class AboutsController < ApplicationController
  def show
    @about_page = AboutPage.first
  end
end
