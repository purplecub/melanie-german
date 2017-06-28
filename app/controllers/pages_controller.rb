class PagesController < ApplicationController
    def contact
        @contact = Contact.new(params[:contact])
        @contact.request = request
        if @contact.save
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:message]
            ContactMailer.contact_email(name, email, body).deliver
            
            flash.now[:success] = 'Message sent.'
            redirect_to root_path # Go back to the index page
        else
            flash.now[:error] = 'Cannot send message.'
            redirect_to root_path # Instead of :new, as we submit from :index
        end 
    end
    
    def index
        @contact = Contact.new
    end
    
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
                redirect_to root_path
            else
                flash[:error] = 'An error occureed. Message not sent.'
                redirect_to root_path
            end
            
            
            end
        
        
    end
    
    def about
    end
    
    def resume
    end
    
    private
        def contact_params
            params.require(:contact).permit(:name, :email, :message)
        end
end
