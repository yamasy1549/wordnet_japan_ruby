require "wordnet_japan"

client = WordNetJapan::Client.new(ARGV[0])
words = client.related_words("学校", link: "上位語", step: 5)

words.each do |step, contents|
  puts "== Step: #{step} =="

  contents.each do |synset:, words:|
    puts "== #{synset.name} =="
    words.each { |word| puts word.lemma }
  end
end
