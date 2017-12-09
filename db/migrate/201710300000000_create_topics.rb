class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at


      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true

    create_table :ats do |t|
      t.string :type, index: true
      t.integer :belong_id, index: true, unsigned: true
      t.string :belong_type, index: true
      t.timestamps
      t.datetime :deleted_at, index: true
    end
    
    add_index :ats, :updated_at
    add_index :ats, [:type, :belong_id, :belong_type]

    create_table(:strs) do |t|
      t.string :value, index: true
      t.string :type, index: true
      t.integer :belong_id, index: true, unsigned: true
      t.string :belong_type, index: true
    end
    
    add_index :strs, [:type, :belong_id, :belong_type]
    
    create_table :rels do |t|
      t.string :type, index: true
      t.integer :f_id, index: true
      t.string :f_type, index: true
      t.integer :l_id, index: true
      t.string :l_type, index: true
    end
    
    add_index :rels, [:type, :f_id, :f_type, :l_id, :l_type]
    
    
    create_table :txts do |t|
      t.text :value
      t.string :type, index: true
      t.integer :belong_id, index: true, unsigned: true
      t.string :belong_type, index: true
    end
    
    add_index :txts, :value, length: 255
    add_index :txts, [:type, :belong_id, :belong_type]
  end
end
