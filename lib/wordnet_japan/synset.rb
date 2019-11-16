require "active_record"

class WordNetJapan::Synset < ActiveRecord::Base
  self.table_name = "synset"

  has_many :senses, foreign_key: :synset, primary_key: :synset
  has_many :words, through: :senses
  has_many :synlinks, foreign_key: :synset1, primary_key: :synset

  attribute :pos, :pos
end
