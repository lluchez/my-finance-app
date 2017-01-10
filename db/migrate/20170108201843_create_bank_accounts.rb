class CreateBankAccounts < ActiveRecord::Migration[5.0]
  def up
    create_table :bank_accounts do |t|
      t.string :name
      t.integer :owner_id

      t.timestamps
    end
  end

  def down
  	drop_table :bank_accounts
  end
end
