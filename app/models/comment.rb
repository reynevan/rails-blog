#coding: UTF-8
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  validates :content, presence: true
  validates :content, length: {minimum: 6}
end
