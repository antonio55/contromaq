class CreateAcfmfs < ActiveRecord::Migration
  def change
    create_table :acfmfs do |t|

      t.timestamps
    end
  end
end
