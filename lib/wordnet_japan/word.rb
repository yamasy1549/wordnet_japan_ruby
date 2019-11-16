require "active_record"

class WordNetJapan::Word < ActiveRecord::Base
  POS = {
    a: "形容詞",
    r: "副詞",
    n: "名詞",
    v: "動詞",
  }

  self.table_name = "word"

  has_many :senses, foreign_key: :wordid, primary_key: :wordid
  has_many :synsets, through: :senses

  attribute :pos, :pos
end
