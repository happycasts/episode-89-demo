class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :asset_url
      t.string :duration

      t.timestamps
    end
  end
end
