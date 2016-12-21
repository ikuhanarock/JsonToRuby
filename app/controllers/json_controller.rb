require 'json'
require 'pry'

class JsonController < ApplicationController
  def index
  end
  
  def get
    logger.info("param is #{params[:query]}")
    
    json = params[:query]
    
    begin
      jsonHash = JSON.parse(json)
    rescue JSON::ParserError => e
      render text: "JSON形式で入力してください。"
    end
    
    hash = {}
    hash.store("RootObject", jsonHash)
    nestHash = serializeHash(jsonHash)
    hash = hash.merge(nestHash)
    
    result = ""
    hash.each do |name, data|
      classStr = createRuby(name, data)
      result.concat(classStr)
    end
    
    logger.info("result is #{result}")
    render text: result
  end
  
  def serializeHash(hash)
    retHash = {}
    
    logger.debug("hash parameter = #{hash}")
    
    hash.each do |name, data|
      if data.kind_of?(Hash)
        logger.debug("hash parameter2 = #{hash}")
        retHash.store(name, data)
        nestHash = serializeHash(data)
        retHash = retHash.merge(nestHash)
      end
    end
    
    retHash
  end
  
  def createRuby(className, hash)
    # classを生成
    result = ""
    result.concat("class #{className}\n")
    hash.each do |name, data|
      if data.kind_of?(Hash)
        result.concat("\t@#{name}\n")
      else
        result.concat("\t@#{name}\n")
      end
    end
    result.concat("end\n\n");
  end
end
