class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  validates :title, presence: true, uniqueness: true, length: { in: 5..20 }
  validates :content, presence: true, length: { in: 5..500 }
  validates :view_count, numericality: { greater_than_or_equal_to: 0 }

  before_save :squeeze
  before_validation :set_view_count

  private

  def squeeze
    self.title.squeeze!(' ')
  end

  def set_view_count
    self.view_count ||= 0
  end

end
