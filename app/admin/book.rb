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

  permit_params :title, :sub_title, :authors, :categories, :image, :origin_title, :language, :pulished_year, :pages, :cover_price, :isbn, :description
 
  menu if: proc{ can? :update, Book }

  index do
    column :title
    column :sub_title
    column :origin_title
    column :language
    column :pulished_year
    column :pages
    column :image
    column :cover_price do |book|
      number_to_currency book.cover_price
    end
    column :isbn
    column :description
    actions
  end

  	form do |f|
        f.inputs "Book Details" do
        	f.input :title
            f.input :sub_title
            f.input :origin_title
            f.input :authors, :as => :check_boxes
            f.input :categories, :as => :check_boxes
            f.input :language
            f.input :pulished_year
            f.input :pages
            f.input :cover_price
            f.input :isbn
            f.input :description
        end
        f.actions
    end

end
