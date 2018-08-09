class StartScrap

@prices = []
@cryptonames = []
@hash = {}

  def initialize(url)
    @url = url
  end

  def perform
    def get_crytocurrencies_names
      webpage = Nokogiri::HTML(open(@url))
      webpage.xpath('//td/a[@class = "currency-name-container link-secondary"]').each do |bli|
        @cryptonames << bli.text
      end
    end

    def get_crytocurrencies_prices
      page = Nokogiri::HTML(open(@url))
      page.xpath('//td/a[@class = "price"]').each do |bam|
        @prices << bam.text
      end
    end

    def hashfilling
      s = 0
      while s < @cryptonames.length
        @hash[@cryptonames[s]] = @prices[s]
        save
        s = s + 1
      end
    end
  end

  def save
    Crypto.create(name: @cryptonames[s], value: @prices[s])
  end
end
