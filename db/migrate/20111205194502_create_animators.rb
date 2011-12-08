class CreateAnimators < ActiveRecord::Migration
  def change
    create_table :animators do |t|

      t.timestamps
    end
  end
end
