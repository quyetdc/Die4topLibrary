# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

# create Admin - just one admin
unless User.exist?(role: 'administrator')
 	User.create(
		email: 'administrator@toplibrary.com'
		password: 'password',
		password_confirmation: 'password',
		fullname: 'Administrator',
		nickname: 'Top Library',
		role: 'administrator'
	)
end 

