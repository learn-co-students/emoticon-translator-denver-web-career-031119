require 'yaml'

def load_library(file)
  new_lib = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(file).each {|meaning, emoticons|
    english = emoticons[0]
    japanese = emoticons[1]
    new_lib["get_meaning"][japanese] = meaning
    new_lib["get_emoticon"][english] = japanese
  }
  new_lib
end

def get_japanese_emoticon(file, emoticon)
  new_lib = load_library(file)
  if new_lib["get_emoticon"][emoticon]
    return new_lib["get_emoticon"][emoticon]
  else
  return "Sorry, that emoticon was not found"
end
end

def get_english_meaning(file, emoticon)
  new_lib = load_library(file)
  if new_lib["get_meaning"][emoticon]
    return new_lib["get_meaning"][emoticon]
  else
  return "Sorry, that emoticon was not found"
  end
  
end