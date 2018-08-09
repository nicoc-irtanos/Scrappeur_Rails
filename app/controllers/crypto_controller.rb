class CryptoController < ApplicationController
  def create
    StartScrap.new.perform
    @crypto = Crypto.find(params[:crypto])
  end
end
