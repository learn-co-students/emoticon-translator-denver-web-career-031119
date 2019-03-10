require "yaml"

def load_library(path)
  emoticons = YAML.load_file(path)
  
  library = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  
  emoticons.each do |meaning, versions|
    library["get_meaning"][versions[1]] = meaning
    library["get_emoticon"][versions[0]] = versions[1]
  end
  
  library
end

def get_japanese_emoticon(path, western_emoticon)
  library = load_library(path)
  
  japanese_emoticon = library["get_emoticon"][western_emoticon]
  
  if japanese_emoticon.nil?
    japanese_emoticon = "Sorry, that emoticon was not found"
  end
  
  japanese_emoticon
end

def get_english_meaning(path, japanese_emoticon)
  library = load_library(path)
  
  english_meaning = library["get_meaning"][japanese_emoticon]
  
  if english_meaning.nil?
    english_meaning = "Sorry, that emoticon was not found"
  end
    
  english_meaning
end
