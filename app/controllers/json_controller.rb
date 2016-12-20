require 'json'
require 'pry'

class JsonController < ApplicationController
  def index
  end
  
  def get
    logger.info("param is #{params[:query]}")
    
    json = params[:query]
    
    begin
      hash = JSON.parse(json)
    rescue JSON::ParserError => e
      render text: "JSON形式で入力してください。"
    end
    
    # classを生成
    result = ""
    result.concat("class RootObject\n")
    hash.each do |name, data|
      result.concat("\t@#{name}\n")
    end
    result.concat("end");
    
    logger.info("result is #{result}")
    render text: result
    #render text: "Hello, world! #{result}"
  end
end
