# frozen_string_literal: true

require 'csv'
class Indexer
  attr_accessor :client

  def initialize(keywords_file)
    @client = Elasticsearch::Persistence.client
    @keywords_file = keywords_file
  end

  def run
    mapping

    word_list.each_slice(1000) do |lines|
      docs = lines.map do |line|
        SearchableWord.new(line[1], line[0])
      end
      @client.bulk bulk_query(docs)
    end
  end

  private

  def word_list
    CSV.open(@keywords_file, col_sep: "\t")
       .select { |line| line[0].present? }
  end

  def mapping
    index = SearchableWord::INDEX

    @client.indices.delete index: index if @client.indices.exists? index: index

    settings = SearchableWord.settings.to_hash
    mappings = SearchableWord.mappings.to_hash

    @client.indices.create index: index, body: {
      settings: settings,
      mappings: mappings
    }
  end

  def bulk_query(docs)
    query = { body: [] }

    docs.flatten.each do |doc|
      header = {
        index: {
          _index: doc.class::INDEX,
          _type: doc.class::TYPE,
          _id: doc._id,
        }
      }
      query[:body] << header
      query[:body] << doc.to_h
    end

    query
  end
end
