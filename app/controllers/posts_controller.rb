class PostsController < ApplicationController
  require 'uri'
  require 'net/http'
  def index
    @anlik = JSONData(URI("https://api.collectapi.com/corona/countriesData?country=Turkey"))
    @toplam = JSONData(URI("https://api.collectapi.com/corona/totalData"))
    @haberler = JSONData(URI("https://api.collectapi.com/corona/coronaNews"))
    puts @anlik
  end
  def show

  end
  def JSONData(uri)
    url = URI(uri)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["content-type"] = 'application/json'
    request["authorization"] = 'apikey 5a5ybHQKybHlJKDmLuvFak:5uv30p0rlZ3QBDlSvdgObA'

    response = http.request(request)
    return JSON.parse(response.body)
  end
end
