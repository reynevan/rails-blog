#coding: UTF-8
class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, :content, presence: true
  validates :title, length: 5..32
  validates :content, length: {minimum: 5}
end
