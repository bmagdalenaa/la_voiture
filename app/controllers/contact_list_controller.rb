class ContactListController < ApplicationController
  def index
    @contactLists = ContactList.all
  end

  def show
    @contactList = ContactList.find(params[:id])
  end
end
