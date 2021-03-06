ActiveAdmin.register Book do

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

  permit_params :title, :sub_title, :image, :origin_title,
  :language, :pulished_year, :pages, :cover_price, :isbn, :description, :authors,
  categories_attributes: [:id, :name, :description, :_destroy], authors_attributes: [:id, :name, :avatar, :description, :_destroy],
  category_ids: [], author_ids: []
 
  menu if: proc{ can? :update, Book }

  scope :all, :default => true
	scope :due_this_week do |tasks|
	  tasks.where('created_at > ?', 1.week.from_now)
	end
	scope :late do |tasks|
	  tasks.where('created_at < ?', Time.now)
	end

  index do
    selectable_column
    	column :id
      column :title do |b|
      	link_to b.title, admin_book_path(b), style: "text-decoration: none"
      end
      # column :sub_title
      # column :origin_title
      column "Image" do |i|
        link_to image_tag(i.image_url(:activeadmin_book_image_thumb)), admin_book_path(i)
      end
      column :language
      column :pulished_year
      # column :pages
      column :cover_price do |book|
        number_to_currency book.cover_price
      end
      # column :isbn
      column :description do |b|
        truncate(b.description, :length => 300)
      end
    actions
  end

  # filter :authors, :as => :check_boxes
  # filter :categories, :as => :check_boxes

  	form(:html => { :multipart => true }) do |f|
        f.inputs "Book Details" do
        	f.input :title
            f.input :sub_title
            f.input :origin_title
            f.input :image, :as => :file, :hint => image_tag(f.object.image_url(:activeadmin_book_image_thumb))
            f.input :language
            f.input :pulished_year
            f.input :pages
            f.input :cover_price
            f.input :isbn
            f.input :description
        end
        f.inputs "Categories List" do
          f.input :categories, :label => "Categories List", :hint => "Các danh mục của cuốn sách này", :collection => Category.all, as: :check_boxes      
            # f.has_many :categories do |s|
            #   s.input :name
            # end
        end

        f.inputs "Authors List" do
          f.input :authors, :label => "Authors List", :hint => "Các tác giả của cuốn sách này", :collection => Author.all, as: :check_boxes      
        end

        f.actions
    end

    show :title => :title do
    	columns do
    		column do
		      panel "Thông tin chi tiết" do
		        table_for book do |t|
		          t.column("Id") { |task| link_to book.id, admin_book_path(task), style: "text-decoration: none" }
		          t.column("Tiêu đề") { |task| link_to book.title, admin_book_path(task), style: "text-decoration: none" }
		          t.column("Tiêu đề phụ") { |task| book.sub_title }
		          t.column("Tiêu đề gốc") { |task| book.origin_title }
		          t.column("Ngôn ngữ") { |task| book.language }
		          t.column("Năm") { |task| book.pulished_year }
		          t.column("Tổng số trang") { |task| book.pages }
		          t.column("Ảnh đại diện") { |task| image_tag(task.image_url(:activeadmin_book_image_thumb)) }
		          t.column("Giá") { |task| book.cover_price }
		          t.column("isbn") { |task| book.isbn }
		          t.column("Mô tả") { |task| book.description }
		        end
		      end
		    end
      	end

      	columns do
      		column do
		    	panel "Các tác giả" do
		      		table_for book.authors do |t|
		      			t.column("Id") { |task| task.id }
		      			t.column("Tên tác giả") { |task| task.name }
                t.column("Ảnh đại diện") { |task| link_to image_tag(task.avatar_url), task }
		      			t.column("Mô tả") { |task| task.description }
		      		end
					# row :author do |book|
					# 	book.authors.map { |d| d.id }.join(", ").html_safe
					#   book.authors.map { |d| d.name }.join(", ").html_safe
					# end
			    end
		   	end

		   	column do
		    	panel "Các danh mục" do
		      		table_for book.categories do |t|
		      			t.column("Id") { |task| task.id }
		      			t.column("Tên danh mục") { |task| task.name }
		      			t.column("Mô tả") { |task| task.description }
		      		end
					# row :author do |book|
					# 	book.authors.map { |d| d.id }.join(", ").html_safe
					#   book.authors.map { |d| d.name }.join(", ").html_safe
					# end
			    end
		   	end
      	end
    end

end
