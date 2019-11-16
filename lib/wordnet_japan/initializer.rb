require "active_record"
require "wordnet_japan/types"

ActiveRecord::Type.register(:pos, POSType)
ActiveRecord::Type.register(:link, LinkType)
