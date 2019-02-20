require 'yaml'
require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = {}
  emoticon_hash["get_emoticon"] = {}
  emoticon_hash["get_meaning"] = {}
  emoticons.each do |k, v|
    emoticon_hash["get_emoticon"][v.first] = v.last
    emoticon_hash["get_meaning"][v.last] = k
  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_emoticon"][emoticon]
  result = "Sorry, that emoticon was not found" if result == nil
  result
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_meaning"][emoticon]
  result = "Sorry, that emoticon was not found" if result == nil
  result
end
