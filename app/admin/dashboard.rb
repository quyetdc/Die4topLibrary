ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Thành viên ban quản trị" do
          table_for User.where.not(role: 'borrower') do |t|
            t.column("Id") { |task| link_to task.id, admin_user_path(task), style: "text-decoration: none" }
            # row("Trạng thái") { |user| status_tag (user.status = 1 ? "Bình thường" : "Khoá"), (user.status ? :ok : :error) }
            t.column("Email") { |task| link_to task.email, admin_user_path(task), style: "text-decoration: none" }
            t.column("Họ và tên") { |task| task.fullname }
            t.column("Ảnh đại diện") { |task| link_to image_tag(task.avatar_url(:activeadmin_user_avatar_thumb)), admin_user_path(task) }
            t.column("Trạng thái") { |task| status_tag (task.status = 1 ? "Bình thường" : "Khoá"), (task.status ? :ok : :error) }
            t.column("Quyền hạn") { |task| task.role }
          end
        end
      end

      column do
          panel "Danh sách các tác giả trong hệ thống" do
            table_for Author.all do |t|
              t.column("Id") { |task| link_to task.id, admin_author_path(task), style: "text-decoration: none" }
              # row("Trạng thái") { |user| status_tag (user.status = 1 ? "Bình thường" : "Khoá"), (user.status ? :ok : :error) }
              t.column("Tên tác giả") { |task| link_to task.name, admin_author_path(task), style: "text-decoration: none" }
              t.column("Ảnh đại diện") { |task| link_to image_tag(task.avatar_url(:activeadmin_author_avatar_thumb)), admin_author_path(task)}
              t.column("Mô tả") { |task| truncate task.description, length: 250 }
            end
          end
      end

    end

    columns do
        
      column do
        panel "Danh sách các danh mục trong hệ thống" do
          table_for Category.all do |t|
            t.column("Id") { |task| link_to task.id, admin_category_path(task), style: "text-decoration: none" }
            # row("Trạng thái") { |user| status_tag (user.status = 1 ? "Bình thường" : "Khoá"), (user.status ? :ok : :error) }
            t.column("Tên danh mục") { |task| link_to task.name, admin_category_path(task), style: "text-decoration: none" }
            t.column("Mô tả") { |task| task.description }
          end
        end
      end

        column do
            panel "Chào mừng tới Active Admin" do
            end
        end
    end
  end # content


end
