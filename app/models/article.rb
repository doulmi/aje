class Article < ApplicationRecord
  validates :title, presence: true
  validates :raw_content, presence: true
  validates :level, presence: true

  before_save do
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
    self.rendered_content = markdown.render(raw_content)
  end
end
