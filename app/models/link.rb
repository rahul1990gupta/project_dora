class Link < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_many :taggings
  has_many :tags, through: :taggings

  validates :title,
            presence: true,
            uniqueness: { case_sensitive: false }
            
  validates :url,
          format: { with: %r{\Ahttps?://} },
          allow_blank: true

  # Virtual attribute
  attr_accessor :tags_input

  # Callback to process tags after the link is saved
  after_save :assign_tags

  def comment_count
    comments.length
  end

  private

  def assign_tags
    return unless tags_input

    puts tags_input
    # Split the input by commas, strip whitespace, and find or create tags
    tag_names = tags_input.split(',').map(&:strip).uniq
    puts tag_names
    tags_to_assign = tag_names.map { |name| Tag.find_or_create_by(name: name) }

    tags_to_assign.each do |tag|
      Tagging.find_or_create_by(link: self, tag: tag)
    end
  end

end
