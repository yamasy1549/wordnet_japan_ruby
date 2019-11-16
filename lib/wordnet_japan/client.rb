require "wordnet_japan/db"
require "wordnet_japan/models"

class WordNetJapan::Client
  def initialize(*args)
    if args.empty?
      initialize_with_default
    elsif args.first.is_a?(String)
      initialize_with_uri(*args)
    else
      raise ArgumentError, "URI must be first or nil"
    end
  end

  def initialize_with_default
    @db = WordNetJapan::DB.connect(nil, options)
  end

  def initialize_with_uri(uri, options={})
    @db = WordNetJapan::DB.connect(uri, options)
  end

  def related_words(word, step: 1, **options)
    word = WordNetJapan::Word.find_by(lemma: word)
    synsets = word.synsets

    step.times.to_h do |i|
      synlinks = synsets.map { |synset| synset.synlinks.where(options) }.flatten
      synsets = synlinks.map(&:dest_synset)
      words = synsets.map do |synset|
        { synset: synset, words: synset.words }
      end

      [i+1, words]
    end
  end
end
