require "uri"

class Translator

  SERVICE_URL = 'http://www.degraeve.com/cgi-bin/babel.cgi'.freeze

  attr_accessor :content, :dialect

  def initialize(content)
    @content = content
  end

  def translate_to(dialect)
    @dialect = dialect.downcase
    get_translation
  end

  private

  def endpoint
    url = URI.parse(SERVICE_URL)
    url.query = URI.encode_www_form(d: @dialect, w: @content)
    url
  end

  def get_translation
    response = Net::HTTP.get_response(endpoint)
    case response.code
    when "200"
      response.body[%r{<p>(.*)</p>}m, 1].strip
    end
  end
end
