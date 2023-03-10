# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
  validates :title, :artist_id, presence: true
  validates :image_url, presence: true, uniqueness: true
  validates :title, uniqueness: { scope: :artist_id }

  has_many :shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User,
    inverse_of: :artworks

  has_many :comments,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy


  def self.artworks_for_user_id(user_id)
    # debugger
    @artworks = User.find_by(id: user_id).artworks + User.find_by(id: user_id).shared_artwork
  end
end
