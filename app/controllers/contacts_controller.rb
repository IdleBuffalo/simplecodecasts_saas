class ContactsController < ApplicationController
   def new
      @contact = Contact.new #creates a new Contact object in computers memory =>
      #it creates a USer object with a list of information, in our case name, email and comments
   end
   
   def create
   end
end