# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  body         :string           not null
#  commenter_id :bigint           not null
#  artwork_id   :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Comment < ApplicationRecord
  validates :body, :artwork_id, :commenter_id, presence: true

  belongs_to :commenter,
    foreign_key: :commenter_id,
    class_name: :User,
    inverse_of: :comments

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork,
    inverse_of: :comments

  def self.comments_for_artwork(artwork_id)
    Artwork.find_by(id: artwork_id).comments
  end

  def self.comments_for_commenter(commenter_id)
    User.find_by(id: commenter_id).comments
  end
end
