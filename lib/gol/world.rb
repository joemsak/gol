module Gol
  class World
    def initialize(attrs = {})
      attrs.each do |k, v|
        send("#{k}=", v)
      end

      @kill = []
      @create = []
    end

    def self.empty
      new(cells: [])
    end

    def empty?
      living_cells.count.zero?
    end

    def living_cells
      cells.select(&:alive?)
    end

    def tick
      cells.each do |cell|
        mark_for_dead(cell) unless cell.alive? && cell.stays_alive?
        come_to_life(cell) if !cell.alive? && cell.coming_to_life?
      end

      kill.each do |cell|
        cells.delete(cell)
        add_dead(cell.location)
      end

      create.each do |cell|
        cells.delete(cell)
        add_living(cell.location)
      end
    end

    def add_living(location)
      @cells << LivingCell.new(location)
    end

    def add_dead(location)
      @cells << DeadCell.new(location)
    end

    private
    attr_accessor :cells, :kill, :create

    def mark_for_dead(cell)
      @kill << cell
    end

    def come_to_life(cell)
      @create << cell
    end
  end
end
