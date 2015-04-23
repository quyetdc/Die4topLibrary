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

    show do
      panel "Tasks" do
        attributes_table_for user do
          row("Id") { |user| link_to user.id, admin_user_path(user), style: "text-decoration: none" }
          # row("Trạng thái") { |user| status_tag (user.status = 1 ? "Bình thường" : "Khoá"), (user.status ? :ok : :error) }
          row("Email") { |user| link_to user.email, admin_user_path(user), style: "text-decoration: none" }
          row("Họ và tên") { |user| user.fullname }
          row("Biệt danh") { |user| user.nickname }
          # row("Quyền hạn") { |user| user.role }
          # row("Thời gian được tạo") { |user| user.created_at }
          # row("Lần cuối cập nhật") { |user| user.updated_at }
        end
      end

      panel "Other Tasks For This User", :only => :show do
          table_for user do |t|
            t.column("Trạng thái") { |task| status_tag (task.status = 1 ? "Bình thường" : "Khoá"), (task.status ? :ok : :error) }
            t.column("Quyền hạn") { |task| task.role }
            t.column("Thời gian được tạo") { |task| task.created_at }
            t.column("Lần cuối cập nhật") { |task| task.updated_at }
          end
        end
      active_admin_comments
    end

end
