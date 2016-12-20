class PostSerializer < ActiveModel::Serializer
  attributes :title

   has_many :comments, :tags
   has_one  :section
end
