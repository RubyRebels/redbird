# https://github.com/activeadmin/activeadmin/tree/master/docs#activeadmin-documentation
ActiveAdmin.register User do
  config.batch_actions = false

  actions :all, except: [:new, :create]

  ### INDEX VIEW
  scope :all, default: true
  scope :admin
  scope :normal
  filter :admin
  filter :name
  filter :email

  index do
    id_column
    column :name do |user|
      link_to user.name, admin_user_path(user)
    end
    column :admin
    column :email
    column "Created", :created_at
    column "Updated", :updated_at
    column :sign_in_count, sortable: false
    column :last_sign_in_at, sortable: false
    column :last_sign_in_ip, sortable: false
  end#index

  ## SHOW VIEW
  show do
    columns do
      column do
        panel "Details" do
          attributes_table_for user do
            row :id
            row :name
            row :email
            row :admin
            row :created do
              user.created_at
            end
            row :updated do
              user.updated_at
            end
            row :remembered do
              user.remember_created_at
            end
            row :sign_ins do
              user.sign_in_count
            end
          end
        end
        active_admin_comments
      end
      column do
        panel "OAuth" do
          attributes_table_for user do
            row :provider
            row :uid
          end
        end
        panel "Current Sign In" do
          attributes_table_for user do
            row :timestamp do
              user.current_sign_in_at
            end
            row :ip_address do
              user.current_sign_in_ip
            end
          end
        end
        panel "Last Sign In" do
          attributes_table_for user do
            row :timestamp do
              user.last_sign_in_at
            end
            row :ip_address do
              user.last_sign_in_ip
            end
          end
        end
      end
    end
  end#show

  ## EDIT VIEW
  permit_params :name, :email, :admin
  form do |f|
    inputs "Details" do
      input :name
      input :email
      input :admin
    end
    actions
  end#form

end
