require "yaml"
require 'pry'

def load_library(data)
  emoticons = YAML.load_file(data)
  emoticons.each do |key,value|
    emoticons[key] = {:english => value[0],:japanese => value[1]}
  end
end

def get_japanese_emoticon(data,emoticon)
  load_library(data).each do |key,value|
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
end

def get_english_meaning(data,emoticon)
    if load_library(data).any? do |meaning,language|
    language[:japanese] == emoticon
      return meaning
    end
  else
    return "Sorry, that emoticon was not found"
  end
end
