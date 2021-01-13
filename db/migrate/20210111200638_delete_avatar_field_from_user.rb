class DeleteAvatarFieldFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :avatar
  end
end
