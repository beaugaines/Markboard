class Page < ActiveRecord::Base
  validates_presence_of :title, :message => "can't be blank"
  validates_length_of :title, :maximum => 100, :message => "is too long"
  validates_length_of :content, :maximum => 100000, :message => "is too long"

  def to_html
    options = { :autolink => true, :space_after_headers => true }
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, options).render(self.content)
  end

  def self.recent_pages
    Page.order("created_at DESC").limit(20).select("id, title")
  end

  def self.all_pages
    Page.order("updated_at DESC").select("id, title, updated_at")
  end
end
