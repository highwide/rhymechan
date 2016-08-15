class SearchableWord
  include Elasticsearch::Persistence::Model
  include Vowelizable

  INDEX = 'seasrchable_words'
  TYPE = 'hatena'

  NUMBER_OF_SHARDS = 5
  NUMBER_OF_REPLICAS = 0

  index_name INDEX
  document_type TYPE

  settings number_of_shards: NUMBER_OF_SHARDS
  settings number_of_replicas: NUMBER_OF_REPLICAS

  attribute :word, String
  attribute :pronunciation, String
  attribute :vowel, String

  def initialize(word, pronunciation)
    @word = word
    @pronunciation = pronunciation
    @vowel = vowelize(pronunciation.tr('ぁ-ん', 'ァ-ン')
                                   .gsub(/ウ゛/, 'ヴ'))
  end

  class << self
    def where(vowel)
      search(size: 100, from: 1, filter: { term: { vowel: vowel } })
    end
  end
end
