class ContactsController < ApplicationController
   def new
      @contact = Contact.new #creates a new Contact object in computers memory =>
      #it creates a USer object with a list of information, in our case name, email and comments You can see if you 
      #type bundle exec rails console and type Console.new to check what it has been stored
   end
   
   def create
      @contact = Contact.new(contact_params)
      
      if @contact.save 
         flash[:success] = "Message sent."
         redirect_to new_contact_path #redirects user to new contact form ... check with bundle exec rake routes
      else
         flash[:danger] = "Error occured, message has not been sent."
         redirect_to new_contact_path #validation are in models/contact rb. ime in email morata bit true, da shrani
      end
   end
   
   private
      def contact_params
         params.require(:contact).permit(:name, :email, :comments)
      end
end