class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :posts_genres_relationships
  has_many :genres, through: :posts_genres_relationships

  default_scope -> {order(created_at: :desc)} 
  validates :user_id, presence: true, allow_nil: true
  validates :content, presence: true, length:{maximum:140 }
  validates :url, presence: true, length: {maximum: 500}
  # validates :posts_genres_relationships_id, presence: true

  enum genre: {ジャンルを選択してください:nil ,経済:"経済",ビジネス:"ビジネス",政治:"政治",マネー:"マネー",スポーツ:"スポーツ",海外:"海外",その他:"その他"}
end
