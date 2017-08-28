class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category

  def date
    /\A\d{4}-\d{2}-\d{2}/.match(self.created_at.to_s)
  end
end
