ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
    
	permit_params :email, :password, :password_confirmation, :fullname, :nickname, :avatar, :status, :role
    
    menu if: proc{ can? :update, User }

    index do
        column :email
        column :fullname
        column :nickname
        column :current_sign_in_at
        column :last_sign_in_at
        column :sign_in_count
        column :status
        column :role
        actions
    end
 
    filter :email
 
    form do |f| 
        f.inputs "User Details" do
        	f.input :fullname
            f.input :nickname
            f.input :email
            f.input :password
            f.input :password_confirmation
            f.input :role, as: :radio, collection: {Administrator: "administrator", Librarian: "librarian", Borrower: "borrower"}
        end
        f.actions
    end

end
