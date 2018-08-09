class CryptoController < ApplicationController
  def create
    @crypto = Crypto.find(params[:crypto])
  end
end
