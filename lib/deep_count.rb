require "deep_count/version"
require "deep_count/adapter"
require "active_record"

module DeepCount
  def deep_count
    DeepCount::Adapter.new( count ).call
  end
end


ActiveRecord::Relation.send(:include,  DeepCount)
