class ChangeDefaultValueVotesCount < ActiveRecord::Migration[6.0]
  def change
    change_column :articles, :votes_count, :integer, default: 0
  end
end
