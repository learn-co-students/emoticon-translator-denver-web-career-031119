# require modules here
require "yaml"


def load_library(file_path)
  # code goes here
  library = YAML.load_file("./lib/emoticons.yml")
  result = {'get_meaning'=>{}, 'get_emoticon'=> {}}

  library.each do |meanings, emoticons|
    result['get_meaning'][emoticons[1]] = meanings
    result['get_emoticon'][emoticons[0]] = emoticons[1]

  end
    result

end

def get_japanese_emoticon(file_path, english_emoticon)
  library = load_library(file_path)
  output = ""
  sorry_message = "Sorry, that emoticon was not found"

  library.each do |meanings, emoticons|
    emoticons.each do |ele|
      if ele[0] == english_emoticon
        output = ele[1]
      end
    end

  end

  if output == ""
    output = sorry_message
  end
  output
end

def get_english_meaning(file_path, japanese_emoticon)
  library = load_library(file_path)
  output = ""
  sorry_message = "Sorry, that emoticon was not found"

  library.each do |meanings, emoticons|
    emoticons.each do |ele|
      if ele[1] == japanese_emoticon
        output = library['get_meaning'][japanese_emoticon]
      end
    end

  end

  if output == ""
    output = sorry_message
  end
  output
end

  # code goes here
