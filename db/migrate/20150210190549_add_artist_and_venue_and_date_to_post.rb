class AddArtistAndVenueAndDateToPost < ActiveRecord::Migration
  def change
    add_column :posts, :artist, :string
    add_column :posts, :venue, :text
  end
end
