class AddReferenceToGoals < ActiveRecord::Migration[5.0]
  def change
    add_reference :goals, :user, index:true, foreign_key: true
  end
end
