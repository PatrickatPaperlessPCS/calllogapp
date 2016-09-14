class ContactsMailer < ApplicationMailer

	def email(contact)
		@contact = contact
	     mail(
	  :subject => "Call Log App: New Flagged Customer Contact" ,
	  :to  => @contact.admin_email ,
	  :track_opens => 'true',
	  :reply_to => @contact.user_email
	)
	     
	end

	def reminder(contact)
		@contact = contact
	     mail(
	  :subject => "Call Log App: New Flagged Customer Contact" ,
	  :to  => @contact.user_email ,
	  :track_opens => 'true',
	)
	    
	end
end
