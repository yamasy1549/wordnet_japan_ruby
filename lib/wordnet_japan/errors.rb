class WordNetJapan::WordNotFoundError < StandardError
  def initialize(msg="WordNet does not have the word.")
    super
  end
end
