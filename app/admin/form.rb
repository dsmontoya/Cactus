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
      column "ID", :id
      column("Email") { |form| User.find(form.user_id).email }
      column "Submitted At", :created_at
      column "First Hackathon", :first_hackathon
      column "Interests", :interests
      column "Proficiences", :proficiences
  end
end