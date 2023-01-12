# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ApplicationRecord.transaction do
  # Destroy tables (not necessary if using `rails db:seed:replant`)
  puts 'Destroying tables...'
  User.destroy_all
  Artwork.destroy_all
  
  # Reset primary keys (i.e., ids) 
  puts 'Resetting id sequences...'
  %w(users artworks).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end

  # Create seed data
  puts 'Creating seed data...'
  u1 = User.create!(username: 'Eric')
  u2 = User.create!(username: 'Ralph')
  u3 = User.create!(username: 'Jeff')
  u4 = User.create!(username: 'Bob')

  a1 = Artwork.create!(title: 'ABC', image_url: 'abc.com', artist_id: 1)
  a2 = Artwork.create!(title: 'XYZ', image_url: 'xyz.com', artist_id: 2)
  a3 = Artwork.create!(title: 'ART', image_url: 'art.com', artist_id: 3)

  share1 = ArtworkShare.create!(artwork_id: 1, viewer_id: 2)
  share2 = ArtworkShare.create!(artwork_id: 3, viewer_id: 4)

  comment1 = Comment.create!(body: 'comment1 on artwork 1 from user 1', commenter_id: 1, artwork_id: 1)
  comment2 = Comment.create!(body: 'comment2 on artwork 2 from user 1', commenter_id: 1, artwork_id: 2)
  comment3 = Comment.create!(body: 'comment3 on artwork 3 from user 2', commenter_id: 2, artwork_id: 3)
  comment4 = Comment.create!(body: 'comment4 on artwork 3 from user 3', commenter_id: 3, artwork_id: 3)
  puts 'Done!'
end