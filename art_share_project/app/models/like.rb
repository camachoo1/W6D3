# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  liker_id      :bigint           not null
#  likeable_type :string           not null
#  likeable_id   :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Like < ApplicationRecord
  belongs_to :liker,
    foreign_key: :liker_id,
    class_name: :User,
    inverse_of: :likes

  belongs_to :likeable, polymorphic: true
end
