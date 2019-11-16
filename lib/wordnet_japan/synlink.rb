require "active_record"

class WordNetJapan::Synlink < ActiveRecord::Base
  LINK = {
    also: "関連",
    syns: "同意語",
    hype: "上位語",
    inst: "例",
    hypo: "下位語",
    hasi: "例あり",
    mero: "被構成要素",
    mmem: "被構成要素（構成員）",
    msub: "被構成要素（物質・材料）",
    mprt: "被構成要素（部分）",
    holo: "構成要素",
    hmem: "構成要素（構成員）",
    hsub: "構成要素（物質・材料）",
    hprt: "構成要素（部分）",
    attr: "属性",
    sim:  "近似",
    enta: "含意",
    caus: "引き起こし",
    dmnc: "被包含領域（カテゴリ）",
    dmnu: "被包含領域（語法）",
    dmnr: "被包含領域（地域）",
    dmtc: "包含領域（カテゴリ）",
    dmtu: "包含領域（語法）",
    dmtr: "包含領域（地域）",
    ants: "反意語",
  }

  self.table_name = "synlink"

  has_one :src_synset, class_name: "Synset", foreign_key: :synset, primary_key: :synset1
  has_one :dest_synset, class_name: "Synset", foreign_key: :synset, primary_key: :synset2
  has_many :senses, through: :dest_synset
  has_many :words, through: :senses

  attribute :link, :link
end
