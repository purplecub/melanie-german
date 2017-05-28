class PagesController < ApplicationController
    def home
        @contact = Contact.new
        
            def contact
        
            @contact = Contact.new(contact_params)
            if @contact.save
                name = params[:contact][:name]
                email = params[:contact][:email]
                body = params[:contact][:message]
                ContactMailer.contact_email(name, email, body).deliver
                
                flash[:success] = 'Message sent.'
                redirect_to new_contact_path
            else
                flash[:error] = 'An error occureed. Message not sent.'
                redirect_to new_contact_path
            end
            
            private
            def contact_params
            params.require(:contact).permit(:name, :email, :message)
            end
            end
        
        
    end
    
    def about
    end
    
    def resume
    end
    
    
end
