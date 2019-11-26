class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :img_url, default: "https://cdn2.vectorstock.com/i/1000x1000/84/31/silhouette-default-avatar-woman-to-social-user-vector-18018431.jpg"
      t.string :bg_url, default: "https://i.ytimg.com/vi/Ia1tjllVygs/maxresdefault.jpg"
      t.integer :coinbank, default:  1000
      t.boolean :active, default: :true

      t.timestamps
    end
  end
end
