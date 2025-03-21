class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :body, presence: true, length: { minimum: 10, maximum: 500 }
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :notifications, through: :user, dependent: :destroy
  has_many :notification_mentions, through: :user, dependent: :destroy
  has_noticed_notifications model_name: "Noticed::Notification"

  def self.ransackable_attributes(_auth_object = nil)
    %w[title body created_at updated_at user_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[posts users comments notifications action_text_rich_texts]
  end
end
