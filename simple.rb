
require 'httparty'
#by api_key make query and respond convert to pretty json-file
class News
  include HTTParty
  API_KEY = '882e10dd2b474a23bb7a3efa85e66b61'.freeze
  base_uri 'https://newsapi.org/v2/'

  def self.prettyJson(country_name)
    new(country_name)
  end

  def initialize(country_name)
    @options = { query: { country: country_name, apiKey: API_KEY} }
    top_headlines
  end

  def top_headlines
    response = self.class.get("/top-headlines", @options).parsed_response
    pretty_show(response)
  end

  private

    def pretty_show(response)
      if File.exist?('responseFileFalse.json')
        puts "Sorry - I would be overwriting a file"
      else
        file = File.new('responseFile.json', 'w')
        file.write(JSON.pretty_generate(response))
        puts JSON.pretty_generate(response)
        file.close
      end
    end
end

News.prettyJson('US')