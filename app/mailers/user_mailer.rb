class UserMailer < ApplicationMailer
	default :from => "vinh.developer@gmail.com"

	def registration_confirmation(user)
		@user = user
	   mail(:to => user.email, :subject => "Registered")
	end
end
