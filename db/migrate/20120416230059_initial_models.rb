class InitialModels < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string  :name
      t.integer :age

      t.references :team

      t.timestamps
    end

    create_table :teams do |t|
      t.string :name
      t.references :coach

      t.timestamps
    end

    create_table :coaches do |t|
      t.string :name
      t.integer :salary

      t.timestamps
    end

    create_table :coaching_sessions do |t|
      t.references :student, :polymorphic => true
      t.references :coach

      t.date :date
    end
  end
end
