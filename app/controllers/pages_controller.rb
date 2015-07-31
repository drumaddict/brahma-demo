# encoding: UTF-8
#Overriden to get previous and next articles
require "#{Brahma::controllers_dir}/pages_controller"
class PagesController < FrontendController
  before_filter :find_page, only: :show

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

  def find_page

    @page=Page.find(params[:id])
    #raise
    # If an old id or a numeric id was used to find the record, then
    # the request path will not match the post_path, and we should do
    # a 301 redirect that uses the current friendly id.
    # if request.path != page_type_path(@page_type)
    #   return redirect_to @page_type, status: :moved_permanently
    # end
  end

end