class ChangePhoneInStudiosToString < ActiveRecord::Migration[5.1]
  def change
    change_column :studios, :phone, :string
  end
end
