class ContactMailer < ActionMailer::Base
    default to: 'melger@me.com'
    
    def contact_email(name, email, body)
        @name = name
        @email = email
        @body = body
        mail(from: email, subject: 'Contact Form Message from melaniegerman.com')
    end
end