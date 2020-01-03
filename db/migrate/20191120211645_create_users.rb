class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :img_url, default: "http://brandesscadmusrealestate.com/images/team/blank.png"
      t.string :bg_url, default: "https://cdn.hipwallpaper.com/i/39/64/bzVo03.jpg"
      t.bigint :coinbank, default:  1000
      

      t.timestamps
    end
  end
end
