module Gol
  class World
    def initialize(attrs = {})
      attrs.each do |k, v|
        send("#{k}=", v)
      end
    end

    def self.empty
      new(living_cells: [])
    end

    def empty?
      living_cells.count.zero?
    end

    def tick
    end

    def add_living(location)
      @living_cells << LivingCell.new(location)
    end

    private
    attr_accessor :living_cells
  end
end
