class ModifyUsersTable < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      # 移除 email_address 的非空约束
      t.change :email_address, :string, null: true
      
      # 移除 email_address 的唯一性索引
      remove_index :users, name: "index_users_on_email", if_exists: true

      # 移除添加 phone_number 列的操作，因为该列已经存在
    end
  end
end