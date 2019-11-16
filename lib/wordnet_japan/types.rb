require "active_record"
require "wordnet_japan/word"
require "wordnet_japan/synlink"

class POSType < ActiveRecord::Type::String
  POS = WordNetJapan::Word::POS
  POS_KEYS = POS.keys.map(&:to_s)
  POS_VALUES = POS.values.map(&:to_s)

  def serialize(value)
    serialized_value = POS.key(value) || POS_KEYS.find { |pos| pos == value.to_s }

    if serialized_value
      return serialized_value.to_s
    else
      raise TypeError, "Value of pos must be in WordNetJapan::Word::POS."
    end
  end

  def cast(value)
    casted_value = POS[value.to_sym] || POS_VALUES.find { |pos| pos == value.to_s }

    if casted_value
      super(casted_value)
    else
      raise TypeError, "Value of pos must be in WordNetJapan::Word::POS."
    end
  end
end

class LinkType < ActiveRecord::Type::String
  LINK = WordNetJapan::Synlink::LINK
  LINK_KEYS = LINK.keys.map(&:to_s)
  LINK_VALUES = LINK.values.map(&:to_s)

  def serialize(value)
    serialized_value = LINK.key(value) || LINK_KEYS.find { |link| link == value.to_s }

    if serialized_value
      return serialized_value.to_s
    else
      raise TypeError, "Value of link must be in WordNetJapan::Word::LINK."
    end
  end

  def cast(value)
    casted_value = LINK[value.to_sym] || LINK_VALUES.find { |link| link == value.to_s }

    if casted_value
      super(casted_value)
    else
      raise TypeError, "Value of link must be in WordNetJapan::Word::LINK."
    end
  end
end
