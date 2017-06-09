class CreateStaticInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :static_infos do |t|
      t.string :email, null: false, default: 'example@example.com'
      t.text :phones, null: false

      t.timestamps
    end
  end
end
