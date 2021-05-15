class CreateCourseItems < ActiveRecord::Migration[6.1]
  def change
    create_table :course_items do |t|
      t.integer :category_id
      t.integer :course_id
      t.integer :pricing_unit
      t.integer :princing_portion

      t.timestamps
    end
  end
end
