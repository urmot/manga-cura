namespace :rank do
  require 'anemone'
  require 'nokogiri'
  require 'kconv'
  require 'active_record'

  #環境設定
  ActiveRecord::Base.establish_connection(
    adapter: :sqlite3,
    encoding: :utf8,
    pool: 5,
    timeout: 5000,
    database: 'db/development.sqlite3'
  )

  class Comic < ActiveRecord::Base
    self.table_name = 'comics'
  end

  #クローラ
  desc 'get scores(batch)'
  task :get_scores, :type do |task, args|
    urls = ['http://www.tonarinoyj.jp/ranking/']
    Anemone.crawl(urls, :depth_limit => 0) do |anemone|
      anemone.on_every_page do |page|
        doc = Nokogiri::HTML.parse(page.body.toutf8)
        get_ranking(doc.css("#ranking-social > ol > li"), false) if Time.now.day == last_day || args[:type] == 'init'
        get_ranking(doc.css("#ranking-access > ol > li"), true) if Time.now.hour == 0 || args[:type] == 'init'
      end
    end
  end

  private

  def get_ranking(doc, dayly)
    doc.each do |doc_comic|
      _title = doc_comic.css("a > dl > dd > p > strong").text
      _score = doc_comic.css("a > dl > dd > em").text

      comic = Comic.find_by(title: _title)
      comic = Comic.new(title: _title) if comic.nil?

      if dayly
        comic.score_day =  _score
      else
        comic.score_month =  _score
      end

      comic.url = 'www.google.com' if comic.url.nil?
      comic.socre = comic.score_month + comic.score_day
      comic.save
      p comic
    end
  end

  def last_day
    month = Time.now.month
    case month
    when 1, 3, 5, 7, 8, 10, 12
      return 31
    when 2
      return Day.today.leap? ? 29 : 28
    when 4, 6, 9, 11
      return 30
    end
  end
end
