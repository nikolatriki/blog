class AddIndexToUsersEmail < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :email, unique: true # ova e metod so tri argumenti definiran vo rails guides za migracii
  end
end
