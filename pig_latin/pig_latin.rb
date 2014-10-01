require "minitest/autorun"

def pig_latin(word)

  word_array = /([^aeiouy]*)(\w*)/.match(word)

  word1 = word_array[1]
  word2 = word_array[2]

  if word1 == ""
    suffix = "way"
  else
    suffix = "ay"
  end

  if word2[0] == "u"
    word2.slice!(0)
    suffix = "uay"
  end

  @pig_latin_word = (word2 + word1 + suffix)
  @pig_latin_word
end

class PigLatinTest < MiniTest::Unit::TestCase
  def test_pig_latin
    word = "glove"
    pig_latin_word = pig_latin(word)

    assert_equal "oveglay", pig_latin_word

    word = "trash"
    pig_latin_word = pig_latin(word)

    assert_equal "ashtray", pig_latin_word

    word = "egg"

    pig_latin_word = pig_latin(word)
    assert_equal "eggway", pig_latin_word

    word = "square"

    pig_latin_word = pig_latin(word)
    assert_equal "aresquay", pig_latin_word
  end
end
