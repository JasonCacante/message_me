# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: { minimum: 2, maximum: 1000 }

  scope :custom_display, -> { order(:created_at).last(20) }
end
