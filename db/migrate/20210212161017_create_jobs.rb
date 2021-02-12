class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs, id: :uuid do |t|
      t.string :title, null: false, default: ''
      t.integer :partner_id, null: false, index: { unique: true }
      t.integer :category_id, null: false, index: true
      t.datetime :expires_at, null: false
      t.string :status, null: false, default: 'draft'

      t.timestamps
    end
  end
end
