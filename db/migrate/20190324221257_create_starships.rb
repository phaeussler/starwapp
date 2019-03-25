class CreateStarships < ActiveRecord::Migration[5.1]
  def change
    create_table :starships do |t|

      t.timestamps
    end
  end
end
