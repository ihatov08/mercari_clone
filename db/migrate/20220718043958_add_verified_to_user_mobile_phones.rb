class AddVerifiedToUserMobilePhones < ActiveRecord::Migration[6.1]
  def change
    add_column :user_mobile_phones, :verified, :boolean
  end
end
