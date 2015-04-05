# encoding: UTF-8
#Overriden to get previous and next articles
require "#{Brahma::controllers_dir}/articles_controller"
class ArticlesController < FrontendController
  before_filter :find_article, only: :show

  def show
    # @article = Article.find(params[:id])
    # @article_group = @article.article_groups.first
    # other_articles_in_group = @article_group.articles.published.reject{|a| a.id == @article.id}
    # two_random_from_others = other_articles_in_group.sample(2)
    # @previous_article = two_random_from_others.first
    # @next_article = two_random_from_others.second
  end

  def index

  end

end