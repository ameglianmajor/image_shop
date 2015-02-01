class AddRetrievalTimeToImages < ActiveRecord::Migration
  def change
    add_column :images, :retrieval_time, :integer
  end
end
