class StartScrap
require 'nokogiri'
require 'open-uri'

  def initialize
    @cryptonames = []
    @prices = []
    @hash = {}
  end

  def get_crytocurrencies_names

    webpage = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    webpage.xpath('//td/a[@class = "currency-name-container link-secondary"]').each do |bli|
      @cryptonames << bli.text
    end
  end

  def get_crytocurrencies_prices
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    page.xpath('//td/a[@class = "price"]').each do |bam|
      @prices << bam.text
    end
  end

  def hashfilling
    @s = 0
    while @s < @cryptonames.length
      @hash[@cryptonames[@s]] = @prices[@s]
      save
      @s = @s + 1
    end
  end

  def save
    Crypto.create(name: @cryptonames[@s], value: @prices[@s])
  end

  def perform
    Crypto.delete_all
    get_crytocurrencies_names
    get_crytocurrencies_prices
    hashfilling
  end
end
