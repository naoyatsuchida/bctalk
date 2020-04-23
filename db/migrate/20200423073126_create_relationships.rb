class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :follow, foreign_key: { to_table: :users } #存在しないfollowクラスではなくuserテーブルからデータを参照するようにしている

      t.timestamps

      t.index [:user_id, :follow_id], unique: true #フォローとフォロワーのペアを一意性にすることで何度もフォローすることを防ぐ
    end
  end
end
