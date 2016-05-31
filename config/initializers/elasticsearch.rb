elasticsearch_url = 'http://localhost:9200'
Elasticsearch::Persistence.client = Elasticsearch::Client.new(host: elasticsearch_url)
