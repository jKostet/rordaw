class DeleteOldStyleFromBeer < ActiveRecord::Migration
  def change
    remove_column :beers, :oldStyle
  end
end
