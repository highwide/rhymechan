elasticsearch_url = ENV.fetch('ELASTICSEARCH_URL', 'http://localhost:9200')
Elasticsearch::Persistence.client = Elasticsearch::Client.new(host: elasticsearch_url)
