class Book < ApplicationRecord
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def self.search_for(search, word)
    if search == "perfect_match"
      Book.where(name: word)
    elsif search == "forward_match"
      Book.where("name LIKE?", word + '%')
    elsif search == "backward_match"
      Book.where("name LIKE?", '%' + word)
    elsif search == "partial_match"
      Book.where("name LIKE?",'%' + word + '%')
    else
      Book.all
    end
  end
end
