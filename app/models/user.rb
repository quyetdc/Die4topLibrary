# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  fullname               :string
#  nickname               :string
#  avatar                 :string           default("default_normal_user_avatar.png")
#  status                 :integer          default(1)
#  role                   :string           default("borrower"), included in [administrator, librarian, borrower]
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :before_save_user_method
  after_create :after_create_user_method

  # TODO Validate role in [administrator, librarian, borrower]
  # validate user email is unique

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
