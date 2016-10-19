require 'nkf'

namespace :index do
  desc 'はてなキーワードをダウンロードしてファイルに保存する'
  task :get_keywords do
    open('http://d.hatena.ne.jp/images/keyword/keywordlist_furigana.csv') do |source|
      keywords_file = Rails.root.join(
        *%w(vendor keywords keywordlist_furigana_utf8.csv)
      ).to_s
      open(keywords_file, 'w') do |file|
        file.write(NKF.nkf('--ic=eucJP-ms --oc=UTF-8', open(source).read))
      end
    end
  end

  desc 'elasticsearchにはてなキーワードをつっこむ'
  task create: :environment do
    keywords_file = Rails.root.join(
      *%w(vendor keywords keywordlist_furigana_utf8.csv)
    ).to_s
    indexer = Indexer.new(keywords_file)
    indexer.run
  end
end
