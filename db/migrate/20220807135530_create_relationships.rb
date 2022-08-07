class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.references :follower, null: false, foreign_key: { to_table: 'users' }
      t.references :followed, null: false, foreign_key: { to_table: 'users' }

      t.timestamps

      t.index %i[follower_id followed_id], unique: true
    end
  end
end
