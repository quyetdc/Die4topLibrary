ActiveAdmin.register Author do

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

permit_params :name, :avatar, :description
 
menu if: proc{ can? :update, Author }

	index do
		column :id
		column :name
		column "Avatar" do |a|
			link_to image_tag(a.avatar_url(:activeadmin_author_avatar_thumb)), admin_author_path(a)
		end
		column :description
		actions
	end

	form(:html => { :multipart => true }) do |f|
		f.inputs "Author Details" do
			f.input :name
			f.input :avatar, :as => :file, :hint => image_tag(f.object.avatar_url(:activeadmin_book_image_thumb))
			f.input :description
			f.actions
		end
	end

	show :name => :name do
		panel "Thông tin chi tiết" do
	        table_for author do |t|
	          t.column("Id") { |task| link_to author.id, admin_author_path(task), style: "text-decoration: none" }
	          t.column("Họ và tên") { |task| link_to author.name, admin_author_path(task), style: "text-decoration: none" }
	          t.column("Ảnh đại diện") { |task| image_tag(task.avatar_url(:activeadmin_author_avatar_thumb)) }
	          t.column("Mô tả") { |task| author.description }
	        end
	    end
	end

end
