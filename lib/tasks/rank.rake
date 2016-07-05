namespace :rank do
  require 'anemone'
  require 'nokogiri'
  require 'kconv'
  require 'active_record'

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

  desc 'get scores'
  task :get_scores do
    urls = []
    urls.push('http://www.cmoa.jp/ranking/cd')
    urls.push('http://www.cmoa.jp/ranking/md')
    urls.push('http://www.cmoa.jp/ranking/wd')

    Anemone.crawl(urls, :depth_limit => 1) do |anemone|

      #総合毎日ランキング
      anemone.on_pages_like(%r[ranking\/[cdmdwd]]) do
        anemone.on_every_page do |page|
          doc = Nokogiri::HTML.parse(page.body.toutf8)
          doc_comics = doc.xpath(%Q[//*[@id="home"]/section[2]/div/div/div/div[4]/ul/li])
          doc_type = doc.xpath(%Q[//*[@id="home"]/section[2]/div/div/div/div[1]/section/div/ul/li/div]).text

          doc_comics.each do |doc_comic|
            break if doc_type.blank?
            _title =  doc_comic.css(".title_box_each_box_title_box_disp_box > .title_name > a").text
            _url =  doc_comic.css(".title_box_each_box_title_box_disp_box > .title_name > a")[0]['href']

            comic = Comic.find_or_create_by(title: _title, url: _url)
            score = (1000 - doc_comic.css(".title_box_each_box_title_box_thum_box > .ranking_detail_title").text.to_f) / 1000

            case doc_type
            when '全体'
              comic.score_day += score
            when '男性'
              comic.score_day_man += score
            when '女性'
              comic.score_day_women += score
            end

            comic.save validate: false
            p comic
          end
        end
      end
    end
  end

end
