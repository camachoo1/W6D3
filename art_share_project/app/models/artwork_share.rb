class ArtworkShare < ApplicationRecord
  validates :artist_id, :viewer_id, presence: true
  validates :artist_id, uniqueness: { scope: :viewer_id }
end