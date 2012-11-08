module Adapter
  module Defaults
    def fetch(key, value=nil)
      read(key) || begin
        if block_given?
          yield(key)
        else
          value
        end
      end
    end

    def read_multiple(*keys)
      result = {}
      keys.each { |key| result[key_for(key)] = read(key) }
      result
    end

    def key?(key)
      !read(key).nil?
    end

    def key_for(key)
      key
    end

    def encode(value)
      value
    end

    def decode(value)
      value
    end
  end
end
