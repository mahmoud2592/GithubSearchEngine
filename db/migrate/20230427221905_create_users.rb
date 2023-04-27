class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :avatar_url
      t.string :location
      t.text :bio
      t.integer :followers_count
      t.integer :following_count
      t.integer :public_repos_count
      t.integer :github_user_id

      t.datetime :system_created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :system_updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
