class CreateFiliations < ActiveRecord::Migration
  def change
    create_table :filiations do |t|
      t.date :date, :defiliation_date
      t.string :uf, :registry_situation
      t.belongs_to :person
      t.belongs_to :political_party

      t.timestamps
    end
  end
end
