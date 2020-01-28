class AddGravatarLinkToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile_image_link, :string
  end
end
