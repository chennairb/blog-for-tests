class Post < ActiveRecord::Base
  has_many :comments

  def self.create_sample
    create(title: 'Sample', body: '')
  end

  def self.having_comments
    Post.where(id: Post.joins(:comments).select('posts.id'))
  end

  def self.with_comment_count
    Post.select('posts.id, COUNT(posts.id) AS comment_count')
      .joins(:comments)
      .group('posts.id')
      .order('comment_count DESC')
  end

  def summary
    title + '-' + body[0..20]
  end
end
