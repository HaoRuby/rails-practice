class Article < ApplicationRecord
  has_many :article_categories
  has_many :categories, through: :article_categories

  # get new articles from another site functions
  def self.get_life_news
    html_data = get_html_data('http://emdep.vn/nhip-song.htm')
    elements = html_data.xpath("//div[contains(@class,'bock-left')]/div[contains(@class,'block-main')]/ul/li[contains(@class,'news-item')]")
    from = 'emdep.vn'
    elements[0..4].each do |element|
      link = 'emdep.vn' + element.xpath("./a/@href").to_s
      if !Article.find_by(link: link)
        title = element.xpath("./a/@title").to_s
        image = element.xpath("./a/div[contains(@class,'img-wrap')]/img/@src").to_s
        content = element.xpath("./div[contains(@class,'sapo')]/text()").to_s
        article = Article.create(from: from, title: title, content: content, image: image, link: link)
        ArticleCategory.create(article_id: article.id, category_id: 1)
      end
    end

    html_data = get_html_data('http://afamily.vn/doi-song.chn')
    elements = html_data.xpath("//div[contains(@class,'list-news1')]/div[contains(@class,'box-x2')]")
    from = 'afamily.vn'
    elements[0..4].each do |element|
      link = 'afamily.vn' + element.xpath("./a/@href").to_s
      if !Article.find_by(link: link)
        title = element.xpath("./a/@title").to_s
        image = element.xpath("./a/img/@src").to_s
        content = element.xpath("./div/p/text()")
        article = Article.create(from: from, title: title, content: content, image: image, link: link)
        ArticleCategory.create(article_id: article.id, category_id: 1)
      end
    end
  end

  def self.get_beauty_news
    html_data = get_html_data('http://afamily.vn/dep.chn')
    elements = html_data.xpath("//div[contains(@class,'list-news1')]/div[contains(@class,'box-x2')]")
    from = 'afamily.vn'
    elements[0..4].each do |element|
      link = 'afamily.vn' + element.xpath("./a/@href").to_s
      if !Article.find_by(link: link)
        title = element.xpath("./a/@title").to_s
        image = element.xpath("./a/img/@src").to_s
        content = element.xpath("./div/p/text()")
        article = Article.create(from: from, title: title, content: content, image: image, link: link)
        ArticleCategory.create(article_id: article.id, category_id: 2)
      end
    end

    html_data = get_html_data('http://eva.vn/lam-dep-c58.html')
    elements = html_data.xpath("//div[contains(@class,'news-special-trangtrong')]/div[contains(@class,'breakingNews-trangtrong')]")
    from = 'eva.vn'
    elements.each do |element|
      link = 'eva.vn' + element.xpath("./a/@href").to_s
      if !Article.find_by(link: link)
        title = element.xpath("./a/@title").to_s
        image = element.xpath("./a/img/@src").to_s
        content = element.xpath("./span[contains(@class,'news-sapo')]/text()")
        article = Article.create(from: from, title: title, content: content, image: image, link: link)
        ArticleCategory.create(article_id: article.id, category_id: 2)
      end
    end
  end

  def self.get_start_news
    html_data = get_html_data('http://kenh14.vn/star.chn')
    elements = html_data.xpath("//ul[contains(@class,'knsw-list')]/li")
    from = 'kenh14.vn'
    elements[0..4].each do |element|
      link = 'kenh14.vn' + element.xpath("./div[contains(@class,'knswli-left')]/a/@href").to_s
      if !Article.find_by(link: link)
        title = element.xpath("./div[contains(@class,'knswli-left')]/a/@title").to_s
        image = element.xpath("./div[contains(@class,'knswli-left')]/a/img/@src").to_s
        content = element.xpath("./div[contains(@class, 'knswli-right')]/span/text()")
        article = Article.create(from: from, title: title, content: content, image: image, link: link)
        ArticleCategory.create(article_id: article.id, category_id: 3)
      end
    end
  end

  def self.get_html_data(url)
    html_data = Nokogiri::HTML(open(url))
  end

end
