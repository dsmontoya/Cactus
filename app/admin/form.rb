ActiveAdmin.register Form do


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


  index do
    selectable_column
      column("ID") { |form| link_to form.id, form_path(form) }
      column("Email") { |form| User.find(form.user_id).email }
      column "Submitted At", :created_at
      column "First Hackathon", :first_hackathon
      column "Interests", :interests
      column "Proficiences", :proficiences
      column "Status", helper.human_readable_status(:status)
  end
end