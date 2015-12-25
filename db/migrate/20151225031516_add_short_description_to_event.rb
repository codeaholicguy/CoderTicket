class AddShortDescriptionToEvent < ActiveRecord::Migration
  def change
    add_column :events, :short_description, :text
  end
end
