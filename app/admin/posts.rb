ActiveAdmin.register Post, as: "Article", namespace: :merchant do
  # actions :all, except: %i[destroy update edit]
  actions :all
  permit_params :title, :content
  menu label: "my posts"

  ActiveAdmin.setup do |config|
    config.default_per_page = [1, 2, 3]
  end

  scope :all, default: true
  filter :title
  index do
    id_column
    column :title
    actions
  end

  ActiveAdmin.register Post do
    show do
      h3 post.title
      # row :title
      div do
        simple_format post.content
      end
    end
  end

  ActiveAdmin.register Post do
    form title: "A Custom title" do |f|
      f.semantic_errors *f.object.errors.keys

      input "Details" do
        input :title
        input :content
      end
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params
  #
  # or
  #
  # permit_params do
  #   permitted = []
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
