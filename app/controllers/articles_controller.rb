class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def create
    @article = Article.create(params.require(:article).permit(:title))
    tag_strings = params[:tag_list].split(',')
    tag_strings.each do |tag_string|
      tag = Tag.find_or_create_by(name: tag_string)
      # Tagging.create(article: @article, tag: tag)
      @article.tags << tag
    end

    redirect_to articles_path
  end
end
