class ContactsController < ApplicationController
  def show
    @contact_page = ContactPage.first
  end
end
