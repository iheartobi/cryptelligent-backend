class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :img_url, default: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRcxydKf3jQLULLej801Y4z9c5cL3uKX_j66GviTQLCH6py0qvc"
      t.string :bg_url, default: "https://i.ytimg.com/vi/Ia1tjllVygs/maxresdefault.jpg"
      t.integer :coinbank, default:  1000
      t.boolean :active, default: :true

      t.timestamps
    end
  end
end
