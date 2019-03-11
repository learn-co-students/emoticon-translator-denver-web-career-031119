# require modules here
require 'yaml'

def load_library(file)
  # code goes here
  library = YAML.load_file(file)

  updated_library = {}
  updated_library["get_meaning"]={}
  updated_library["get_emoticon"]={}

  library.each do |emotion, emojis|
    updated_library["get_meaning"][emojis[1]] = emotion
  end

  library.each_value do |emojis|
    updated_library["get_emoticon"][emojis[0]] = emojis[1]
  end
  return updated_library
end

def get_japanese_emoticon(file, english_emoji)
  # code goes here
  library = load_library(file)
  found = library["get_emoticon"][english_emoji]
  if found
    return found
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, japanese_emoji)
  # code goes here
  library = load_library(file)
  found = library["get_meaning"][japanese_emoji]
  if found
    return found
  else
    return "Sorry, that emoticon was not found"
  end
end
