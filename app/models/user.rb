class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :before_save_user_method
  after_create :after_create_user_method

  mount_uploader :avatar, ImageUploader

  	def password_required?
      new_record? ? false : super
    end

    def role?(r)
        role.include? r.to_s
    end

    def before_save_user_method
      self.role = 'borrower' if self.role.blank?
    end

    def after_create_user_method
		UserMailer.registration_confirmation(self).deliver
		unless self.role? :borrower
		  self.send_reset_password_instructions
		end
	end
end
