require 'yaml'
require 'pry'


def load_library(library)
  emoticon_library = YAML.load_file(library)
  emoticon_hash = {"get_meaning" => {}, "get_emoticon" => {}}

  emoticon_library.each do |meaning, emoticons|
    index = 0
    emoticons.each do |emoticon|
      if index == 1
        emoticon_hash["get_meaning"][emoticon] = meaning
      elsif index == 0
        emoticon_hash["get_emoticon"][emoticon] = emoticon_library[meaning][1]
      end
      index += 1
    end
  end
  emoticon_hash
end

def get_japanese_emoticon(library, emoticon)
  emoticon_hash = load_library(library)
  japanese_emoticon = nil
  emoticon_hash["get_emoticon"].each do |english, japanese|
    if english == emoticon
      japanese_emoticon = japanese
    end
  end

  if japanese_emoticon == nil
    "Sorry, that emoticon was not found"
  else
    japanese_emoticon
  end
end

def get_english_meaning(library, emoticon)
  emoticon_hash = load_library(library)
  english_meaning = nil

  emoticon_hash["get_meaning"].each do |japanese, meaning|
    if japanese == emoticon
      english_meaning = meaning
    end
  end

  if english_meaning == nil
    "Sorry, that emoticon was not found"
  else
    english_meaning
  end
end
