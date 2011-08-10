require 'bson'
require 'hirb'
require 'interactive_editor'
require 'json'
require 'mongo'
require 'pp'
require 'wirble'
#require 'win32/console/ansi'  # Support colorization
require 'yaml'


IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:USE_READLINE] = true

Wirble.init
Wirble.colorize
Hirb.enable


class Object
  def local_methods(obj = self)
    obj.methods(false).sort
  end
end

# Monkey-patch mongo's BSON so that I can treat it like an ostruct
module BSON
  class OrderedHash
    def method_missing(method_id, *args)
      method_name = method_id.id2name
      len = args.length
      if method_name.chomp!('=')
        if len != 1
          raise ArgumentError, "wrong number of arguments (#{len} for 1)", caller(1)
        end
        return self[method_name] = args[0]
      elsif len == 0
        return self[method_name]
      else
        raise NoMethodError, "undefined method '#{method_name}' for #{self}", caller(1)
      end
    end
  end
end

# Visualize BSON like a db table
class Hirb::Helpers::BSONOrderedHash
  def self.render(output, opts={})
    Hirb::Helpers::Table.render([output])
  end
end
Hirb.add_view(BSON::OrderedHash, :class => Hirb::Helpers::BSONOrderedHash)
