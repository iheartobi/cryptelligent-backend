class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :img_url, default: "http://brandesscadmusrealestate.com/images/team/blank.png"
      t.string :bg_url, default: "http://wrbbradio.org/wp-content/uploads/2016/10/grey-background-06.jpg"
      t.bigint :coinbank, default:  1000
      

      t.timestamps
    end
  end
end
