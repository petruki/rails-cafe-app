class CreateDailyMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_menus do |t|
      t.date :created

      t.timestamps
    end
  end
end
