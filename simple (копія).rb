
require 'httparty'
#by api_key make query and respond convert to pretty json-file
class Parser
  include HTTParty
  API_KEY = '882e10dd2b474a23bb7a3efa85e66b61'.freeze
  base_uri 'https://newsapi.org/v2/'

  attr_reader :var
 

  def self.top_headlines(country_name) # метод класу
    new(country_name).top_headlines # виклик методу top_headlines на екземплярі класу
  end

  def initialize(country_name)
    @options = { query: { country: country_name, apiKey: API_KEY} }
  end

  def top_headlines # метод екземпляру
    response = self.class.get("/top-headlines", @options).parsed_response
    @var = response
   	write_file
    self
  end

    def write_file
      if File.exist?('responseFileFalse.json')
        puts "Sorry - I would be overwriting a file"
      else
        file = File.new('responseFile.json', 'w')
        file.write(JSON.pretty_generate.response)
        read_file
        file.close
      end
    end

    def read_file
    	puts JSON.pretty_generate
    end
end

Parser.top_headlines('US')
parser = Parser.top_headlines('us')
p parser.var

p parser.write_file
#p parser.read_file


