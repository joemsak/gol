module Gol
  class World
    def initialize(attrs = {})
      attrs.each do |k, v|
        send("#{k}=", v)
      end

      @kill = []
    end

    def self.empty
      new(cells: [])
    end

    def empty?
      cells.select(&:alive?).count.zero?
    end

    def tick
      cells.each do |cell|
        mark_for_dead(cell) unless cell.alive? && cell.stays_alive?
      end

      kill.each do |cell|
        cells.delete(cell)
        add_dead(cell.location)
      end
    end

    def add_living(location)
      @cells << LivingCell.new(location)
    end

    def add_dead(location)
      @cells << DeadCell.new(location)
    end

    private
    attr_accessor :cells, :kill

    def mark_for_dead(cell)
      @kill << cell
    end
  end
end
