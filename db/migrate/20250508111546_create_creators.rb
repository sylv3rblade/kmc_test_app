class CreateCreators < ActiveRecord::Migration[8.0]
  def change
    create_enum "creators_statuses", [ "active", "inactive" ]

    create_table :creators do |t|
      t.string :name
      t.string :email
      t.enum :status, enum_type: :creators_status

      t.timestamps
    end
  end
end
